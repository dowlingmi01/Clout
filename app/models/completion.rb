class Completion < ApplicationRecord
  belongs_to :user
  belongs_to :completion_source, polymorphic: true
end
