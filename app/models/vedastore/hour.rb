class Vedastore::Hour < ActiveRecord::Base
  include XsdRailsFunctions

  belongs_to :hourable, polymorphic: true
  include Vedaspace::Hour
  
end
