class Vedastore::Count < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Count
  
  belongs_to :countable, polymorphic: true
  
end
