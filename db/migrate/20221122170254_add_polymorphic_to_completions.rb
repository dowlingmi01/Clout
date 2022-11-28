class AddPolymorphicToCompletions < ActiveRecord::Migration[7.0]
  def change
    remove_column :completions, :survey_id
    add_reference :completions, :completion_source, polymorphic: true
  end
end
