class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id', dependent: :nullify
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id', dependent: :nullify

  validates :name, presence: true

  def matches
    [home_matches, away_matches]
  end
end
