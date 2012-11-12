class Vote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :value
end
