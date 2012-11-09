class User < ActiveRecord::Base
  attr_accessible :username

  validates_presence_of :username

  def self.authenticate(username)
    user = find_by_username(username)
    if user
      user
    else
      nil
    end
  end
end
