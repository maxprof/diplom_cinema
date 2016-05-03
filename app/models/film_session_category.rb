class FilmSessionCategory < ActiveRecord::Base
  belongs_to :film_session
  belongs_to :category
end
