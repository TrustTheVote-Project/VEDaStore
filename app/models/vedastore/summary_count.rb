class Vedastore::SummaryCount < Vedastore::Count
  include XsdRailsFunctions
  
  belongs_to :summary_countable, polymorphic: true
  include Vedaspace::SummaryCount
    
end
