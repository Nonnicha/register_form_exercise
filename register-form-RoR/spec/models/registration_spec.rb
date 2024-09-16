require 'rails_helper'

RSpec.describe Registration, type: :model do
  it 'Is valid with valid attributes' do
    registration = Registration.new(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      phone: '1234567890'
    )
    expect(registration).to be_valid
  end

  it 'Is not valid without a firstName' do
    registration = Registration.new(
      lastName: 'Doe',
      email: 'john.doe@example.com',
      phone: '1234567890'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:firstName]).to include("can't be blank")
  end

  it 'Is not valid without a lastName' do
    registration = Registration.new(
      firstName: 'John',
      email: 'john.doe@example.com',
      phone: '1234567890'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:lastName]).to include("can't be blank")
  end

  it 'Is not valid without an email' do
    registration = Registration.new(
      firstName: 'John',
      lastName: 'Doe',
      phone: '1234567890'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:email]).to include("can't be blank")
  end

  it 'Is not valid without a phone' do
    registration = Registration.new(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com'
    )
    expect(registration).not_to be_valid
    expect(registration.errors[:phone]).to include("can't be blank")
  end
end
