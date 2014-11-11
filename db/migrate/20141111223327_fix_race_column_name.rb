class FixRaceColumnName < ActiveRecord::Migration
  def change
  	rename_column :races, :type, :race_type
  end
end
