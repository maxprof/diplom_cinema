FactoryGirl.define do
  factory :cinema do
    sequence(:cinema_name) { |i| "cinema #{i}"}
    cinema_addr "Unosti"
    user_id 1
  end
end
