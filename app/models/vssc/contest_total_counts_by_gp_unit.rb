class Vssc::ContestTotalCountsByGpUnit < ActiveRecord::Base
  belongs_to :contest
  belongs_to :total_count
end
