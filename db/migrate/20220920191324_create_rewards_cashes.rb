class CreateRewardsCashes < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards_cashes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :survey, null: false, foreign_key: true
      t.decimal :rewards_cash_amount
      t.text :comments

      t.timestamps
    end
  end
end
