include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :film_session do
    sequence(:session_name) { |i| "Session#{i}"}
    sequence(:description) { |i| "#{i} test session description"}
    cinema_id 1
    number_of_session_place 100
    rating 6
    session_start_date "2016-08-27"
    session_end_date "2017-08-27"
    trailer_link "AaEH4AgPb2A"
    film_sessions_poster { fixture_file_upload(Rails.root.join("spec/fixtures/images/calendar.png"), 'image/png') }
    user_id 1
  end
end
