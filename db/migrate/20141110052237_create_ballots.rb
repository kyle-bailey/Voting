class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|

      t.timestamps
    end
  end
end
