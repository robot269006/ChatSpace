FactoryGirl.define do
  factory :user do
    email  {Faker::Internet.email }
    name   {Faker::Name.first_name }
    password {Faker::Internet.password(8)}
  end
end
