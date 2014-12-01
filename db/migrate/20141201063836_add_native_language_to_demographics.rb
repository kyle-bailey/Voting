class AddNativeLanguageToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :native_language, :string
  end
end
