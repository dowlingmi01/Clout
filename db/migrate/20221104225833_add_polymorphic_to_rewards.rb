class AddPolymorphicToRewards < ActiveRecord::Migration[7.0]
  def change
    add_reference :rewards_cashes, :rewards_cash_source, polymorphic: true
    add_reference :experiences, :experience_source, polymorphic: true
    add_reference :survey_rewards, :survey_reward_source, polymorphic: true
  end
end
