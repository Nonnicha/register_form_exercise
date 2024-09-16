FactoryBot.define do
  factory :registration do
    firstName { Faker::Name.first_name }
    lastName  { Faker::Name.last_name }
    email     { Faker::Internet.email }
    phone     { Faker::PhoneNumber.phone_number }
    birthday  { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender    { 'Male' }
    subject   { 'Test Subject' }
  end
end