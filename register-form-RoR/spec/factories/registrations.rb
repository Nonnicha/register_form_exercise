FactoryBot.define do
  factory :registration do
    firstName { 'Chanon' }
    lastName  { 'Wiriyathanachit' }
    email     { Faker::Internet.email }
    phone     { '0987654321' }
    birthday  { '1999-09-03' }
    gender    { 'Male' }
    subject   { 'Test Subject' }
  end
end