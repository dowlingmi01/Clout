class Category < ApplicationRecord
	validates :name, presence: true, length: {minimum: 5 }
	validates_uniqueness_of :name

	has_many :surveys
end
