class Place < ActiveRecord::Base
	has_many :film_session
	belongs_to :cinema
  # accepts_nested_attributes_for :film_sessions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end

