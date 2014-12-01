class AddStraightPartyAndEveryOfficeToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :straight_party, :string
    add_column :demographics, :every_office, :string
  end
end
