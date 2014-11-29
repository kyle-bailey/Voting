class AddThemeToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :theme, :string
  end
end
