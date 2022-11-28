class AddKeyToQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "vote_options", "questions"
    add_foreign_key "vote_options", "questions", on_delete: :cascade
  end
end
