class FilmSession < ActiveRecord::Base
	belongs_to :cinema
	has_many :places, :dependent => :destroy
  belongs_to :user
  validates :user_id, presence: true
  validates :session_name,  uniqueness: true, presence: true
  validates :cinema_id, presence: true
  validates :number_of_session_place, presence: true


  # accepts_nested_attributes_for :places, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end



