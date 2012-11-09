class Issue < ActiveRecord::Base
  attr_accessible :description, :status, :title

  belongs_to :user
  has_many :comments

  before_create :default_values
  before_update :current_status

  def answer_accepted?
    array = self.comments.select {|c| c.is_answer == true}
    if array.empty?
      false
    else
      true
    end
  end

  def current_status
    if self.answer_accepted?
      self.status = "resolved"
    elsif self.created_at <= 30.minutes.ago
      self.status = "instructor needed"
    end
  end

  def default_values
    self.status = "open"
  end

end
