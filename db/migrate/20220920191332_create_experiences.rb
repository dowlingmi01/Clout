class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :survey, null: false, foreign_key: true
      t.integer :experience_amount
      t.text :comments

      t.timestamps
    end
  end
end
