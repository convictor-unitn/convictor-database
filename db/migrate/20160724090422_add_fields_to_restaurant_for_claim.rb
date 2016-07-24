class AddFieldsToRestaurantForClaim < ActiveRecord::Migration
  def change
    add_column :restaurants, :company_name, :string
    add_column :restaurants, :vat_number, :string
    add_column :restaurants, :fiscal_code, :string

    add_column :ownership_notices, :company_name, :string, null: false
    add_column :ownership_notices, :vat_number, :string, null: false
    add_column :ownership_notices, :tax_code, :string, null: false
    add_column :ownership_notices, :contact_phone , :string, null: false
  end
end
