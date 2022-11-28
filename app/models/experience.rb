class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :experience_source, polymorphic: true
end
