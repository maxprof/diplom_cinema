class Place < ActiveRecord::Base
	has_many :film_sessions
	belongs_to :cinema
  belongs_to :user
  validates :user_id, presence: true
  # accepts_nested_attributes_for :film_sessions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end


