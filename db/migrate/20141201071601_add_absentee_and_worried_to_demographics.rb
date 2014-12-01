class AddAbsenteeAndWorriedToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :absentee, :string
    add_column :demographics, :worried, :string
  end
end
