class Vedastore::SummaryCount < Vssc::Count

  belongs_to :summary_countable, polymorphic: true
    
end
