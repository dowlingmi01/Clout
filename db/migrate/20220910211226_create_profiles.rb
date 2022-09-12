class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age
      t.string :gender
      t.string :ethnicity
      t.string :country

      t.timestamps
    end
  end
end
