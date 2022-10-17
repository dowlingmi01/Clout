class AddRewardsToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :rewards_cash, :decimal
    add_column :surveys, :experience, :integer
    add_column :surveys, :survey_reward, :decimal
  end
end
