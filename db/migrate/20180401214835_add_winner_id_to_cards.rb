class AddWinnerIdToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :winnerId, :integer
  end
end
