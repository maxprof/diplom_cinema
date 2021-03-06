class FilmSession < ActiveRecord::Base
  has_many :comments, as: :commentable, :dependent => :destroy
	belongs_to :cinema
  has_many :film_session_session_times
  has_many :session_times, through: :film_session_session_times
  has_many :film_session_categories
  has_many :categories, through: :film_session_categories, :counter_cache => true
	has_many :places, :dependent => :destroy
  belongs_to :user
  validates :user_id, presence: true
  validates :session_name, presence: true
  validates :cinema_id, presence: true
  validates :number_of_session_place, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :trailer_link, presence: true
  validates :film_sessions_poster, presence: true

  has_attached_file :film_sessions_poster, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :film_sessions_poster, content_type: /\Aimage\/.*\Z/

  delegate :cinema_name, :to => :cinema, :prefix => true



  def self.search(search)
    if search
      where(["session_name LIKE ?","%#{search}%"])
    elsif
      all
    end
  end
  # accepts_nested_attributes_for :places, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end






