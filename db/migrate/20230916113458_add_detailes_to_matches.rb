class AddDetailesToMatches < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :matches, :teams, column: :home_team_id
    add_foreign_key :matches, :teams, column: :away_team_id
  end
end
