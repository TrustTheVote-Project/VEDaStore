class Vedastore::ExternalIdentifierCollection < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::ExternalIdentifierCollection
    
  belongs_to :identifiable, polymorphic: true

  has_many :external_identifiers
  
end
