class CreateStockMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_movements do |t|
      t.bigint :stock_movement_type_id, null: false
      t.bigint :client_id, null: false
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
