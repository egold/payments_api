class CreateStockMovementTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_movement_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
