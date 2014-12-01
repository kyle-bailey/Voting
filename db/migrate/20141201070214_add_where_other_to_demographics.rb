class AddWhereOtherToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :where_other, :text
  end
end
