class Place < ActiveRecord::Base
	has_many :film_session
	belongs_to :cinema
end
 