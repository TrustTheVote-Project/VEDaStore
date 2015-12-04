class Vedastore::ExternalIdentifierCollection < ActiveRecord::Base
  include XsdRailsFunctions
    
  belongs_to :identifiable, polymorphic: true

  has_many :external_identifiers
  include Vedaspace::ExternalIdentifierCollection
  
end
