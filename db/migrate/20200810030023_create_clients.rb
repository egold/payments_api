class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :username
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
