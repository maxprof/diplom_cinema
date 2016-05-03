FactoryGirl.define do
  factory :news do
    sequence(:title) { |i| "#{i} test news title"}
    sequence(:description) { |i| "#{i} test news description, must have minimum 40 letters"}
    user_id 1
    news_poster { fixture_file_upload "#{Rails.root}/spec/fixtures/images/calendar.png", 'image/png' }
  end
end

