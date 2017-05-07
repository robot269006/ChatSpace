FactoryGirl.define do
  pass = Faker::Internet.password(8)
  factory :user do
    email  {Faker::Internet.email }
    name   {Faker::Name.first_name }
    password pass
    password_confirmation pass
  end
end
