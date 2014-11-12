class AddInstructionsToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :instructions, :text
  end
end
