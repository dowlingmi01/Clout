class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.integer :experience
      t.decimal :rewards_cash
      
      t.timestamps
    end
  end
end
