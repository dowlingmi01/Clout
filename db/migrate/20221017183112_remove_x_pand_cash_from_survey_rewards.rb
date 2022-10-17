class RemoveXPandCashFromSurveyRewards < ActiveRecord::Migration[7.0]
  def change
    remove_column :survey_rewards, :rewards_cashes
    remove_column :survey_rewards, :experiences
  end
end
