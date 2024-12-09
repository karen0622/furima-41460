class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :building
      t.timestamps
    end
  end
end
