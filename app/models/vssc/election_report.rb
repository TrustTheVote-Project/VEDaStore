require 'csv'
class Vssc::ElectionReport < ActiveRecord::Base
  
  include VsscFunctions
  
  def self.find_with_eager_load(id)
    e = self.where(id: id).includes([
      {:gp_units=>[
          :reporting_unit_authority_refs,
          :contacts,
          :gp_sub_units, 
          :gp_sub_unit_refs, 
          :total_counts, 
          :party_registration,
          {:spatial_dimensions=>[:spatial_extent]},
          {:ocd_object=>[:shapes]}
        ]},
      :ballot_selections,
      {:people=>[
        {:contacts=>[:reporting_units]}
      ]},
      :offices,
      {:elections=>[
          {:ballot_styles=>[:ordered_contests]},
          {:candidates=>[:offices]},
          {:contests=>[
            {:ballot_selections=>[
                #:counts,
                {:candidate_selection_candidate_refs=>[:candidate]}
              ]},
            {:contest_total_counts=>[:total_count]},
            :total_counts_by_gp_unit
          ]}
        ]
      }
    ]).first
    
    #load all counts
    ballot_selection_ids = []
    e.elections.each do |election|
      election.contests.each do |contest|
        puts "Loading contest #{contest.inspect} ballot selections"
        Rails.logger.debug("Loading contest #{contest.inspect} ballot selections")
        ballot_selection_ids << contest.ballot_selections.collect(&:id)
      end
    end

    # puts ballot_selection_ids.count
    #
    
    batch_size = 10000
    
    count = Vssc::Count.where(:ballot_selection_id=>ballot_selection_ids).count
    puts count
    Rails.logger.debug("#{count} Counts")
    
    ballot_selection_counts = {}
    
    Vssc::Count.where(:ballot_selection_id=>ballot_selection_ids).find_in_batches(batch_size: batch_size).with_index do |group, batch|
      puts "Loading #{batch * batch_size} of #{count}"
      Rails.logger.debug("Loading #{batch * batch_size} of #{count}")
      group.each do |vc|
        ballot_selection_counts[vc.ballot_selection_id] ||= []
        ballot_selection_counts[vc.ballot_selection_id] << vc        
      end
    end

    e.elections.each do |election|
      election.contests.each do |contest|
        puts "Substituting contest #{contest.inspect} ballot selections"
        Rails.logger.debug("Substituting contest #{contest.inspect} ballot selections")
        contest.ballot_selections.each do |bs|
          records = ballot_selection_counts[bs.id] || []
          association = bs.association(:counts)
          association.loaded!
          association.target.concat(records.to_a)
          records.each { |record| association.set_inverse_instance(record) }
        end
      end
    end
    
    return e
    
  end

  define_element("Message")
  define_element("GPUnitCollection", type: Vssc::GPUnit, method: :gp_units, passthrough: "GPUnit")
  has_and_belongs_to_many :gp_units, :class_name=>"Vssc::GPUnit"
  
  define_element("PartyCollection", type: Vssc::Party, method: :ballot_selections, passthrough: "Party")
  has_and_belongs_to_many :ballot_selections, association_foreign_key: 'party_id', join_table: 'vssc_ballot_selections_election_reports'
  
  define_element("PersonCollection", type: Vssc::Person, method: :people, passthrough: "Person")
  has_and_belongs_to_many :people
  define_element("OfficeCollection", type: Vssc::Office, method: :offices, passthrough: "Office")
  has_and_belongs_to_many :offices
  
  
  define_element("Election", method: :elections, type: Vssc::Election)
  has_many :elections
  
  
  define_attribute("object_id", required: true)
  define_attribute("date", required: true, type: "xsd:dateTime")
  define_attribute("format", required: true, type: Vssc::ReportFormat)
  define_attribute("status", required: true, type: Vssc::ReportStatus)
  define_attribute("issuer", required: true)
  define_attribute("sequence", required: true, type: Fixnum)
  define_attribute("sequenceEnd", required: true, type: Fixnum)
  define_attribute("stateAbbreviation", required: true)
  define_attribute("stateCode")
  define_attribute("vendorApplicationID", required: true)
  
  def xml_attributes_hash_with_root(node_name)
    attr_hash = xml_attributes_hash_without_root(node_name)
    attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
    attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/fake_url"
    attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/fake_url file:///G:/1622.2/ElectionResultsV29.xsd"
    return attr_hash
  end
  
  alias_method_chain :xml_attributes_hash, :root
  
end
