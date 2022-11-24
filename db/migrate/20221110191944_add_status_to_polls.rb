class AddStatusToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :status, :string
  end
end
