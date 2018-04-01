class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :num1
      t.integer :num2
      t.integer :num3
      t.integer :num4

      t.timestamps
    end
  end
end
