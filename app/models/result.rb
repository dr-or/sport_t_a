class Result < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :players, through: :performances

  before_validation :downcase_body

  validates :body, presence: true, uniqueness: true

  def reach_by(player, match)
    Performance.create(result: self, player: player, match: match)
  end

  private

  def downcase_body
    body&.downcase!
  end
end
