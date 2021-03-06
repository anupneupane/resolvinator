class Answer < ActiveRecord::Base
   attr_accessible :content, :accepted_answer, :user

   has_many :comments, :as => :commentable
   belongs_to :user
   belongs_to :issue
   has_many :votes

   def total_votes
      votes.sum(:value)
   end

end
