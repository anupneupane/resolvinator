class Comment < ActiveRecord::Base
  attr_accessible :content, :is_answer, :user
  belongs_to :issue
  belongs_to :user
  has_many :votes

  accepts_nested_attributes_for :votes

  # def votes
  #   read_attribute(:votes) || votes.sum(:value)
  # end

end
