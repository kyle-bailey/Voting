class AddDurationToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :duration, :datetime
  end
end
