class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.integer :home_team_id
      t.integer :away_team_id

      t.timestamps
    end
  end
end
