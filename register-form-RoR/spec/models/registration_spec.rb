RSpec.describe Registration, type: :model do
  it 'กรอกข้อมูลครบทำงานสำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      gender: 'male',
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).to be_valid
  end

  it 'ไม่กรอกชื่อทำงานไม่สำเร็จ' do
    registration = Registration.new(
      lastName: "Wiriyathanachit",
      gender: 'male',
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:firstName]).to include("Please enter your first name.")
  end

  it 'ไม่กรอกนามสกุลทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      gender: 'male',
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:lastName]).to include("Please enter your last name.")
  end

  it 'ไม่กรอกเพศทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:gender]).to include("Please enter your gender.")
  end

  it 'ไม่กรอกวันเกิดทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      gender: 'male',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:birthday]).to include("Please enter your birth date.")
  end

  it 'ไม่กรอกอีเมลทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      gender: 'male',
      birthday: '1999-09-03',
      phone: '0987654321',
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:email]).to include("Please enter your email.")
  end

  it 'ไม่กรอกเบอร์โทรศัพท์ทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      gender: 'male',
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      subject: 'Test Subject'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:phone]).to include("Please enter your phone number.")
  end

  it 'ไม่กรอกเรื่องทำงานไม่สำเร็จ' do
    registration = Registration.new(
      firstName: 'Chanon',
      lastName: "Wiriyathanachit",
      gender: 'male',
      birthday: '1999-09-03',
      email: Faker::Internet.email,
      phone: '0987654321',
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:subject]).to include("Please enter your subject.")
  end
end