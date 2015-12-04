class Vedastore::Count < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :countable, polymorphic: true
  include Vedaspace::Count
  
end
