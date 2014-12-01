class AddReadingDisabilityToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :reading_disability, :string
  end
end
