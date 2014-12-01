class AddHearingImpairmentAndNativeEnglishToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :hearing_impairment, :string
    add_column :demographics, :native_english, :string
  end
end
