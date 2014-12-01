class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
