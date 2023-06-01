class Doctor < ApplicationRecord
  include Devisable

  MAXIMUM_APPOINTMENTS_COUNT = 10
  PHONE_REGEX = /\A\+380\d{9}\z/

  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :rememberable, :validatable,
         authentication_keys: %i[phone]

  belongs_to :category, class_name: 'DoctorCategory', foreign_key: :doctor_category_id, inverse_of: :doctors

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, uniqueness: true, format: { with: PHONE_REGEX }
  validates :appointments, length: { maximum: MAXIMUM_APPOINTMENTS_COUNT }
end
