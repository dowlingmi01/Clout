class RewardsCash < ApplicationRecord
  belongs_to :rewards_cash_source, polymorphic: true
  belongs_to :user
end
