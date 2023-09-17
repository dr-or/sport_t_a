class RenameAchievements < ActiveRecord::Migration[7.0]
  def change
    rename_table :achievements, :results

    rename_column :performances, :achievement_id, :result_id
  end
end
