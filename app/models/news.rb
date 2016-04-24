class News < ActiveRecord::Base
  belongs_to :user
  has_attached_file :news_poster, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :news_poster, content_type: /\Aimage\/.*\Z/
end
