class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :user_id
      t.integer :project
      t.integer :amount

      t.timestamps
    end
  end
end
