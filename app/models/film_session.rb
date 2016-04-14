class FilmSession < ActiveRecord::Base
	belongs_to :cinema
	has_many :places, :dependent => :destroy
  # accepts_nested_attributes_for :places, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end

