FactoryGirl.define do
  factory :message do
    body       { Faker::Lorem.sentence }
    created_at { Faker::Time.backward(3, :evening)}
    updated_at { Faker::Time.backward(3, :evening)}
  end
end
