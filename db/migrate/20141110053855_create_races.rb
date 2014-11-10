class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :title
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
