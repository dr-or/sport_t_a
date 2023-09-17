class Performance < ApplicationRecord
  belongs_to :player
  belongs_to :result
  belongs_to :match
end
