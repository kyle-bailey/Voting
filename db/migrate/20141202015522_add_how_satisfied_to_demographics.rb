class AddHowSatisfiedToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :how_satisfied, :text
  end
end
