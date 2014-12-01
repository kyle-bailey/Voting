class AddOtherSpecificationToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :other, :text
  end
end
