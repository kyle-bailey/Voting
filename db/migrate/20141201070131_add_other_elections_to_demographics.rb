class AddOtherElectionsToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :other_elections, :text
  end
end
