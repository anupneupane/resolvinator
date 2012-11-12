class Comment < ActiveRecord::Base
  attr_accessible :content, :is_answer
  belongs_to :issue
  belongs_to :user
  has_many :votes

  accepts_nested_attributes_for :votes


end
