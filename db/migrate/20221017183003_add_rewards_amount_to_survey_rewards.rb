class AddRewardsAmountToSurveyRewards < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_rewards, :survey_reward_amount, :decimal
  end
end
