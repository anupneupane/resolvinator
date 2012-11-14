class User < ActiveRecord::Base
  attr_accessible :username

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :issues
  has_many :comments
  has_many :answers
  has_many :votes

  # before_save { |user| user.username = username.downcase }

  def self.authenticate(username)
    user = find_by_username(username)
    if user
      user
    else
      nil
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
