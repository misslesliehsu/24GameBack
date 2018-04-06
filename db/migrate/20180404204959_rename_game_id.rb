class RenameGameId < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :gameId, :game_id
    rename_column :players, :gameId, :game_id
  end
end
