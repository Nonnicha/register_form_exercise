FactoryBot.define do
  factory :registration do
    firstName { Faker::Name.first_name.gsub(/[^a-zA-Z]/, '') }
    lastName  { Faker::Name.last_name.gsub(/[^a-zA-Z]/, '') }
    birthday  { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender    { ['Male', 'Female'].sample }
    email     { Faker::Internet.email }
    phone     { "0#{Faker::Number.number(digits: 9)}" }
    subject   { ['HTML', 'CSS', 'Javascript'].sample }
  end
end