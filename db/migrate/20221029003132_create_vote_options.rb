class CreateVoteOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :vote_options do |t|
      t.string :title
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
