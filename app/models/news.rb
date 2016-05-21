class News < ActiveRecord::Base
  belongs_to :user
  has_attached_file :news_poster, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :news_poster, content_type: /\Aimage\/.*\Z/
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 40 }
  validates :news_poster, presence: true
end
