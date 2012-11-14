require 'debugger'

class Vote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :value

  belongs_to :comment
  belongs_to :user

  # validates_uniqueness_of :comment_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author
  validate :ensure_no_double_voting



  private
  def ensure_not_author
    self.errors.add :user_id, "is the author of the response" if self.comment.user_id == user_id
  end

  def ensure_no_double_voting
    total_users_votes_on_comment = Vote.where(:user_id => self.user_id, :comment_id => self.comment_id).sum(:value)
    self.errors.add :user_id, "no double voting" unless (total_users_votes_on_comment + self.value).between?(-1, 1)
  end

end




