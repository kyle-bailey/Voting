class AddUnsureAndUnsureExplanationToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :unsure, :string
    add_column :demographics, :unsure_explanation, :text
  end
end
