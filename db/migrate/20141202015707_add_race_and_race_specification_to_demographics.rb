class AddRaceAndRaceSpecificationToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :race, :string
    add_column :demographics, :race_specification, :text
  end
end
