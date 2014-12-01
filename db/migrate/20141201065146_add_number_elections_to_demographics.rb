class AddNumberElectionsToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :number_elections, :string
  end
end
