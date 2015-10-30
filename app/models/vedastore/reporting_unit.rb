class Vedastore::ReportingUnit < Vedastore::GpUnit
  include XsdRailsFunctions
  include Vedaspace::ReportingUnit

  has_many :gp_unit_authority_id_refs, foreign_key: :gp_unit_id
  has_many :authorities, through: :gp_unit_authority_id_refs
  
  has_many :count_statuses, as: :count_statusable

  has_many :party_registrations, as: :party_registrationable
  
end
