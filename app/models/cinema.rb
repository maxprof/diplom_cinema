class Cinema < ActiveRecord::Base
	has_many :film_sessions
	has_many :places
end
 