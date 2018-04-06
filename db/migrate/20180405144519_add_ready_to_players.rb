class AddReadyToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :ready, :boolean
  end
end
