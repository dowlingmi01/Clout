class AddCategoryIdToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :category_id, :integer
    add_index :surveys, :category_id
  end
end
