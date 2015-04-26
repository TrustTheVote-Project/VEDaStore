class Vssc::ContestTotalCount < ActiveRecord::Base
  belongs_to :contest
  belongs_to :total_count
end
