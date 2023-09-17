class Achievement < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :players, through: :performances

  validates :body, presence: true

  def reach_by(player, match)
    Performance.create(achievement: self, player: player, match: match)
  end
end
