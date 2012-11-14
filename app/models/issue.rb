class Issue < ActiveRecord::Base
  include AASM
  attr_accessible :description, :status, :title, :answer_id, :aasm_state

  belongs_to :user
  has_many :comments

  # before_create :default_values
  before_update :current_status

  def current_status
    if self.resolved?
    elsif self.answer_accepted?
      self.resolve
    elsif self.created_at < 45.minutes.ago
      self.ask_instructor
    elsif self.created_at < 15.minutes.ago
      self.open
    end
    self.aasm_state
  end

  def answer_accepted?
    self.comments.find_by_is_answer(true) if self.comments

    # array = self.comments.select {|c| c.is_answer == true}
    # if array.empty?
    #   false
    # else
    #   true
    # end
  end

  def is_owner?(issue)
    current_user == issue.user
  end

  aasm do
    state :fresh, :initial => true
    state :opened
    state :instructor_asked
    state :resolved

    event :open do
      transitions :from => :fresh, :to => :opened
    end

    event :ask_instructor, :after => :notify_instructor do
      transitions :from => [:fresh, :opened], :to => :instructor_asked
    end

    event :resolve do
      transitions :from => [:fresh, :opened, :instructor_asked], :to => :resolved
    end

    def notify_instructor
      # ping Avi here
      # show in Avi's view
    end
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
