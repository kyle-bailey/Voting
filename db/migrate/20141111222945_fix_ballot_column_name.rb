
class FixBallotColumnName < ActiveRecord::Migration
  def change
  	rename_column :ballots, :type, :organization
  end
end
