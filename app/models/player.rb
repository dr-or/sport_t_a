class Player < ApplicationRecord
  belongs_to :team
  has_many :performances, dependent: :destroy
  has_many :results, through: :performances

  validates :first_name, presence: true
  validates :last_name, presence: true

  def achieve?(result)
    last_matches = self.team.matches.sort_by(&:match_date).last(5)
    self.performances.where(result: result, match: last_matches).any?
  end
end
