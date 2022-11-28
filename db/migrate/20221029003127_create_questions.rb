class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :poll
      t.text :topic
      t.text :comment
      t.string :option_type
      
      t.timestamps
    end
  end
end
