class AddFinishedAtToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :finished_at, :datetime
  end
end
