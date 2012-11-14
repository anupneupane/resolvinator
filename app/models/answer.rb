class Answer < ActiveRecord::Base
   attr_accessible :content, :accepted_answer, :user

   has_many :comments, :as => :commentable
   belongs_to :user
   belongs_to :issue

end
