class AddRewardsToPoll < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :experience, :integer
    add_column :polls, :rewards_cash, :decimal
  end
end
