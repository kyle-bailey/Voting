class AddVisualFieldToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :visual_field, :string
  end
end
