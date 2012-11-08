class Comment < ActiveRecord::Base
  attr_accessible :content, :is_answer
  belongs_to :issue
end
