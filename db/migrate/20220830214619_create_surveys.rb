class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :survey_name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
