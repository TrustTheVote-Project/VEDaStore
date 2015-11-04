class Vedastore::Schedule < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Schedule
  
  belongs_to :schedulable, polymorphic: true
  
  has_many :hours, as: :hourable
  
end
