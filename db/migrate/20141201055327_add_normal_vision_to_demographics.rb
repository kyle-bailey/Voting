class AddNormalVisionToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :normal_vision, :string
  end
end
