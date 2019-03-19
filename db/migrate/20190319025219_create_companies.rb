class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :description
      t.attachment :logo
      t.attachment :cover

      t.timestamps
    end
  end
end
