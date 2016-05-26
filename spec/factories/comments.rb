include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :comment do
    sequence(:body) { |i| "Body#{i}"}
    user_id 1
    commentable_type "FilmSession"
    commentable_id 1
  end
end

