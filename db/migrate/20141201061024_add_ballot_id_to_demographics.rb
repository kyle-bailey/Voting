class AddBallotIdToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :ballot_id, :integer
  end
end
