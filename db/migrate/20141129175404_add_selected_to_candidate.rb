class AddSelectedToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :selected, :boolean
  end
end
