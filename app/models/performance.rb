class Performance < ApplicationRecord
  belongs_to :player
  belongs_to :result
  belongs_to :match

  validates_uniqueness_of :player_id, scope: %i[result_id match_id]
end
