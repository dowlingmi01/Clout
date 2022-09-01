class AddFieldsToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :start_date, :datetime
    add_column :surveys, :end_date, :datetime
    add_column :surveys, :cpi, :integer
    add_column :surveys, :incidence, :integer
    add_column :surveys, :loi, :integer
  end
end
