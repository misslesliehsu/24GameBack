class AddGameIdtoPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :gameId, :integer
  end
end
