class AddVisualAcuityToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :visual_acuity, :string
  end
end
