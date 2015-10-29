class Vedastore::Hour < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Hour

  belongs_to :hourable, polymorphic: true
  
end
