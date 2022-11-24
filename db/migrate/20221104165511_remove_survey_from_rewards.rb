class RemoveSurveyFromRewards < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :survey_id
    remove_column :rewards_cashes, :survey_id
    remove_column :survey_rewards, :survey_id
  end
end
