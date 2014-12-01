class AddWhereVotedToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :where_voted, :text
  end
end
