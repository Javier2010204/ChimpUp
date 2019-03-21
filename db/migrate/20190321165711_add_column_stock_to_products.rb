class AddColumnStockToProducts < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :stock, :integer
      add_column :products, :min_stock, :integer
  end
end
