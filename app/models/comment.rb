class Comment < ActiveRecord::Base
  validates  :user_id, presence: true
  validates  :body, presence: true, length: { minimum: 10 }
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end

