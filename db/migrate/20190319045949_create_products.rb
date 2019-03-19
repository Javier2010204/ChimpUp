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

      t.timestamps
    end
  end
end
