class Vedastore::OfficeGroup < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::OfficeGroup
  
  has_many :office_group_office_id_refs
  has_many :offices, through: :office_group_office_id_refs
  
  has_many :office_groups, as: :office_groupable
  
  belongs_to :office_groupable, polymorphic: true
end