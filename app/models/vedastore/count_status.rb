class Vedastore::CountStatus < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :count_statusable, polymorphic: true
  include Vedaspace::CountStatus
  
end
