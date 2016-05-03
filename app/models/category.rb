class Category < ActiveRecord::Base
  has_many :film_session_categories
  has_many :film_sessions, through: :film_session_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
end
