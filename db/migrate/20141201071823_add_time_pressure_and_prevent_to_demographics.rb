class AddTimePressureAndPreventToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :time_pressure, :string
    add_column :demographics, :prevent, :string
  end
end
