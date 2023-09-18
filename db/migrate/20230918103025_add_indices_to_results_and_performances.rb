class AddIndicesToResultsAndPerformances < ActiveRecord::Migration[7.0]
  def change
    add_index :results, :body, unique: true

    add_index :performances, %i[player_id result_id match_id], unique: true
  end
end
