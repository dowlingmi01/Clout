class Poll < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :experiences, as: :experience_source
  has_many :rewards_cashes, as: :rewards_cash_source

  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  enum status: { draft: 'draft', open: 'open', closed: 'closed' }

end
