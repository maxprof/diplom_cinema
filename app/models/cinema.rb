class Cinema < ActiveRecord::Base
	has_many :film_sessions
  belongs_to :user
  validates :user_id, presence: true
  validates :cinema_name,  uniqueness: true, presence: true
  validates :cinema_addr,  presence: true

end



