class Profile < ApplicationRecord
  belongs_to :user

  validates :age, :gender, :ethnicity, :country, presence: true

  def self.select_options_for_gender
    [['Male', 'male'], ['Female','female'], ['Other','other']]
  end
  def self.select_options_for_ethnicity
    [['American Indian', 'american indian'], ['Asian','asian'], ['Black or African American','black or african american'], ['Hispanic or Latino ', 'hispanic or latino'], ['Native Hawaiian','native hawaiian'], ['White or Caucasian','white or caucasian']]
  end
end