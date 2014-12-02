class AddVotedToRace < ActiveRecord::Migration
  def change
    add_column :races, :voted, :boolean
  end
end
