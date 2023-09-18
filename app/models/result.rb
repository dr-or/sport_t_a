class Result < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :players, through: :performances

  before_validation :downcase_body

  validates :body, presence: true, uniqueness: true

  def achieved_by(player, match)
    Performance.create(result: self, player: player, match: match)
  end

  def top_five_players(team = nil)
    players_w_result = self.players
                           .select('players.*, COUNT(*) AS players_count')
                           .group('players.id')
                           .order(players_count: :desc)
    
    return players_w_result.first(5).map(&:full_name) unless team

    players_w_result.select { |player| player.team_id == team.id }.first(5).map(&:full_name)
  end

  private

  def downcase_body
    body&.downcase!
  end
end
