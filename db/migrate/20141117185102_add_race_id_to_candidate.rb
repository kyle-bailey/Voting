class AddRaceIdToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :race_id, :integer
  end
end
