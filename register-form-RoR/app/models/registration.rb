class Registration < ApplicationRecord
  validates :firstName, presence: { message: "Please enter your first name." }
  validates :firstName, format: { with: /\A[a-zA-Z]+\z/, message: "Please use only English letter in first name." }, if: -> { firstName.present? }

  validates :lastName, presence: { message: "Please enter your last name." }
  validates :lastName, format: { with: /\A[a-zA-Z]+\z/, message: "Please use only English letter in last name." }, if: -> { lastName.present? }

  validates :phone, presence: { message: "Please enter your phone number." }
  validates :phone, format: { with: /\A(\+66|0)\d{9}\z/, message: "Invalid phone number format." }, if: -> { phone.present? }

  validates :birthday, presence: { message: "Please enter your birth date." }

  validates :email, presence: { message: "Please enter your email." }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format." }, if: -> { email.present? }

  validates :gender, presence: { message: "Please enter your gender." }

  validates :subject, presence: { message: "Please enter your subject." }
end