class Vedastore::SummaryCount < Vedastore::Count
  include XsdRailsFunctions
  
  #belongs_to :countable, polymorphic: true
  include Vedaspace::SummaryCount
    
end
