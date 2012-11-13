class Vote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :value

  belongs_to :comment
  belongs_to :user

  validates_uniqueness_of :comment_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author



  private
  def ensure_not_author
    self.errors.add :user_id, "is the author of the response" if self.comment.user_id == user_id
  end

end




