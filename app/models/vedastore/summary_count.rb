class Vedastore::SummaryCount < Vedastore::Count

  belongs_to :summary_countable, polymorphic: true
    
end
