require 'csv'

class Jurisdiction < ActiveRecord::Base
  
  has_many :districts, :dependent=>:destroy
  has_many :reporting_units, :dependent=>:destroy
  
  
  CSV_HEADERs = [
    "TYPE", #ignored
    "ID",         #internal
    "NAME",	
    "DISTRICTTYPE",	
    "SEQUENCE",	
    "DISTRICTTYPE",	
    "GROUPID",	
    "VISIBLE",	
    "STANDARD_DISTRICT_TYPE",	
    "STANDARD_UID",	
    "OCD_ID",
    "ENCLOSING_IDS"
  ]
    
    
  # districts
  # t.string   "name"
  # t.string   "internal_id"
  # t.string   "district_type"
  # t.datetime "created_at",      null: false
  # t.datetime "updated_at",      null: false
  # t.integer  "ocd_object_id"
  # t.integer  "jurisdiction_id"
  
  # RUs
  # t.string   "name"
  # t.string   "internal_id"
  # t.datetime "created_at",      null: false
  # t.datetime "updated_at",      null: false
  # t.integer  "ocd_object_id"
  # t.integer  "jurisdiction_id"
  
  # OCD
  # t.string   "name"
  # t.string   "unit_type"
  # t.string   "district_type"
  # t.string   "ocd_id"
  # t.datetime "created_at",    null: false
  # t.datetime "updated_at",    null: false
  # t.integer  "ocd_object_id" - this is for "parent" levels (maybe unnecessary)

  def background_csv
    @background_csv
  end
    
  def background_csv=(file)
    @background_csv=file
    load_from_csv(file.read)
  end
    
  def load_from_csv_file(filename)
    File.open(filename, "r") do |f|
      load_from_csv(f.read)
    end
  end
  
  def load_from_csv(filedata)
    enclosings = {} # ru.id => [district]
    mappings = []
    internal_objects = {"precinct" => {}}    
    rus = {}
    districts = {}
    CSV.parse(filedata, headers: true) do |row|    
      case row["TYPE"].to_s.downcase
      when "", "district"
        d = self.districts.build
        d.name = row["NAME"]
        d.internal_id = row["ID"]
        d.district_type = row["DISTRICT_TYPE"]
        d.build_ocd_object
        d.ocd_object.name = row["NAME"]
        d.ocd_object.district_type = row["STANDARD_DISTRICT_TYPE"]
        d.ocd_object.ocd_id = row["OCD_ID"]
        districts[d.internal_id] = d
      when "precinct"
        r = self.reporting_units.build
        r.internal_id = row["ID"]
        r.name = row["NAME"]
        r.build_ocd_object
        r.ocd_object.name = row["NAME"]
        r.ocd_object.ocd_id = row["OCD_ID"]
        if row["ENCLOSING_IDS"]
          row["ENCLOSING_IDS"].split(',').each do |encloser|
            e_type, e_internal_id = encloser.split(':')
            
            if e_type == "District"
              enclosings[r] ||= []
              enclosings[r] << e_internal_id
            else
              # shouldn't be anything else
            end
          end
        end
        rus[r.internal_id] = r
      else # it's  a mapping from Precinct to District
        if row["ENCLOSING_IDS"]
          row["ENCLOSING_IDS"].split(',').each do |encloser|
            e_type, e_internal_id = encloser.split(':')
            if e_type == "District"
              internal_objects[row["TYPE"].downcase] ||= {}
              internal_objects[row["TYPE"].downcase][row["ID"]] ||= []
              internal_objects[row["TYPE"].downcase][row["ID"]] << "district:#{e_internal_id}"
            elsif e_type == "Precinct"
              internal_objects["precinct"] ||= {}
              internal_objects["precinct"][e_internal_id] ||= []
              internal_objects["precinct"][e_internal_id] << "#{row["TYPE"].downcase}:#{row["ID"]}"
            end
          end
        end        
      end
    end
    # turn internal objects into enclosings
    internal_objects["precinct"].each do |precinct_id, enclosers|
      r = rus[precinct_id]
      if r.nil?
        raise precinct_id.to_s
      end
      enclosers.each do |encloser|
        e_type, e_internal_id = encloser.split(':')
        internal_objects[e_type.downcase][e_internal_id].each do |district_encloser|
          d_type, d_internal_id = district_encloser.split(':')
          enclosings[r] ||= []
          enclosings[r] << d_internal_id
        end
      end
    end
    # handle enclosings
    enclosings.each do |ru, d_internal_ids|
      d_internal_ids.uniq.each do |d_id|
        ru.districts << districts[d_id]
      end
    end
    
    self.save!
  end
  
end
