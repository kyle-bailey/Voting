class AddCandidateToVote < ActiveRecord::Migration
  def change
    add_column :votes, :candidate, :string
  end
end
