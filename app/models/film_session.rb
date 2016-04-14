class FilmSession < ActiveRecord::Base
	belongs_to :cinema
	has_many :places
end
 