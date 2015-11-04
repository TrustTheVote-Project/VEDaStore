class Vedastore::CountStatus < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::CountStatus
  
  belongs_to :count_statusable, polymorphic: true
  
end
