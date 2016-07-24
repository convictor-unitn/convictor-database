class RenameFiscalCodeInRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :fiscal_code, :tax_code
  end
end
