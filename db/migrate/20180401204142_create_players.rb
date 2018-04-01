class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :playerName
      t.integer :points

      t.timestamps
    end
  end
end
