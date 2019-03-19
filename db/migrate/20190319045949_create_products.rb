class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :sale_price
      t.decimal :cost_price
      t.string :state
      t.decimal :offer_price
      t.attachment :avatar
      t.references :company, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
