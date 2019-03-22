class AddColumnBioToCompanies < ActiveRecord::Migration[5.2]
  def change
      add_column :companies, :bio, :string
  end
end
