class Vedastore::Schedule < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :schedulable, polymorphic: true
  
  has_many :hours, as: :hourable
  include Vedaspace::Schedule
  
end
