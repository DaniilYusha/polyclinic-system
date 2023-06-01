class DoctorCategory < ApplicationRecord
  has_many :doctors, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
