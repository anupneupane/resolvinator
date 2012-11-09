class Issue < ActiveRecord::Base
  attr_accessible :description, :status, :title

  belongs_to :user
  has_many :comments

  before_create :default_values
  before_update :current_status

  def answer_accepted?
    self.comments.find_by_is_answer(true)

    # array = self.comments.select {|c| c.is_answer == true}
    # if array.empty?
    #   false
    # else
    #   true
    # end
  end

  def current_status
    if self.answer_accepted?
      self.status = "resolved"
    elsif self.created_at <= 30.minutes.ago
      self.status = "instructor needed"
    end
  end

  private

  def default_values
    self.status = "open"
  end

        #state change#
  ##########################

  #issue created - new
    #Restricted access to comments. only immediate group should be able to respond (to be implemented later)





  #15 minutes after creation of issue - open
    #issue should be open to everyone(important)



  #1 hour after creation of issue - instructor needed
    # issue would then display instructor needed tag
    # issue would ping instructor through email, twitter, facebook, snail mail, carrier pigeon, etc.
    







  #issue answered -resolved (if comments.is_answer == true then :closed state)
    #Restricted access. Only the issue creator can reopen the issue for comments

        # verify current user (if current_user == user_id then 'full access')





  ##########################






end
