class Vedastore::SummaryCount < Vedastore::Count
  include XsdRailsFunctions
  include Vedaspace::SummaryCount
  
  belongs_to :summary_countable, polymorphic: true
    
end
