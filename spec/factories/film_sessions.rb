FactoryGirl.define do
  factory :film_session do
    sequence(:session_name) { |i| "Session#{i}"}
    sequence(:description) { |i| "#{i} test session description"}
    cinema_id 1
    number_of_session_place 100
    rating 6
    date "2016-04-27"
    trailer_link "AaEH4AgPb2A"
    film_sessions_poster { fixture_file_upload "#{Rails.root}/spec/fixtures/images/calendar.png", 'image/png' }
    user_id 1
  end
end
