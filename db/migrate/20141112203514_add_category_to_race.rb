class AddCategoryToRace < ActiveRecord::Migration
  def change
    add_column :races, :category, :text
  end
end
