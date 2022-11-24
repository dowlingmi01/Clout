class AddIndexToVotes < ActiveRecord::Migration[7.0]
  def change
    add_index :votes, [:vote_option_id, :user_id], unique: true
    remove_column :votes, :vote_option_id
  end
end
