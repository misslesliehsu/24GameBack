class AddGameIdtoCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :gameId, :integer
  end
end
