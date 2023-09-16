class ChangePlayersName < ActiveRecord::Migration[7.0]
  def change
    change_table :players do |t|
      t.rename :name, :first_name
      t.string :last_name
    end
  end
end
