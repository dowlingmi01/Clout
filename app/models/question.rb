class Question < ApplicationRecord
  acts_as_list
  
  has_many :vote_options, dependent: :delete_all
  belongs_to :poll 
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true


  def self.select_options_for_type
    [['Single Select', 'single_select'], ['Multi Select','multi_select']]
  end

  def normalized_votes_for(option)
    votes_summary == 0 ? 0 : (option.votes.count.to_f / votes_summary) * 100
  end

  def votes_summary
    vote_options.inject(0) {|summary, option| summary + option.votes.count}
  end

end
