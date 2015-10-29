class Vedastore::Hours < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Hours

  belongs_to :hourable, polymorphic: true
  
end
