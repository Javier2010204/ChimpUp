class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :sale_price, precision: 10, scale: 2
      t.decimal :cost_price, precision: 10, scale: 2
      t.decimal :offer_price, precision: 10, scale: 2
      t.string :state
      t.integer :stock
      t.integer :min_stock
      t.integer :offer
      t.attachment :avatar
      t.references :company, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
