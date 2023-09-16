class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :performances, dependent: :destroy

  def teams
    [home_team, away_team]
  end
end
