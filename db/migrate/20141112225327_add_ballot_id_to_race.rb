class AddBallotIdToRace < ActiveRecord::Migration
  def change
    add_column :races, :ballot_id, :integer
  end
end
