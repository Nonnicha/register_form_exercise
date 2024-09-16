RSpec.describe Registration, type: :model do
  it 'กรอกข้อมูลครบทำงานสำเร็จ' do
    registration = Registration.new(
      firstName: Faker::Name.first_name,
      lastName: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    )
    expect(registration).to be_valid
  end

  it 'ไม่กรอกชื่อทำงานไม่สำเร็จ' do
    registration = Registration.new(
      lastName: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:firstName]).to include("can't be blank")
  end

  it 'ไม่กรอกนามสกุลทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: Faker::Name.first_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:lastName]).to include("can't be blank")
  end

  it 'ไม่กรอกอีเมลทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: Faker::Name.first_name,
      lastName: Faker::Name.last_name,
      phone: Faker::PhoneNumber.phone_number
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:email]).to include("can't be blank")
  end

  it 'ไม่กรอกเบอร์โทรศัพท์ทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: Faker::Name.first_name,
      lastName: Faker::Name.last_name,
      email: Faker::Internet.email
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:phone]).to include("can't be blank")
  end
end