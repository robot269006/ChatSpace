FactoryGirl.define do
  factory :message do
    body       { Faker::Lorem.sentence }
    user_id    1
    group_id   1
    created_at { Faker::Time.backward(3, :evening)}
    updated_at { Faker::Time.backward(3, :evening)}
  end
end
