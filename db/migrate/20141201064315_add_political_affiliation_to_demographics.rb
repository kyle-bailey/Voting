class AddPoliticalAffiliationToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :political_affiliation, :string
  end
end
