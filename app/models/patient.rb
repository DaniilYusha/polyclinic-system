class Patient < ApplicationRecord
  include Devisable

  PHONE_REGEX = /\A\+380\d{9}\z/

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         authentication_keys: %i[phone]

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, uniqueness: true, format: { with: PHONE_REGEX }
end
