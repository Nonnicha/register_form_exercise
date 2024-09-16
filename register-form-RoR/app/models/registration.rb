class Registration < ApplicationRecord
  validates :firstName, :lastName, :email, :phone, presence: true
end
