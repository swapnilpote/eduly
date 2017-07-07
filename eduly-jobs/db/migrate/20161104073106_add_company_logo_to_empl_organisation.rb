class AddCompanyLogoToEmplOrganisation < ActiveRecord::Migration
  def change
    add_column :empl_organisations, :company_logo, :string
  end
end
