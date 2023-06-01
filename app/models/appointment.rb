class Appointment < ApplicationRecord
  enum status: { pending: 0, closed: 1 }

  belongs_to :doctor
  belongs_to :patient

  has_one :recommendation, dependent: :destroy

  validates :datetime, presence: true
  validate :validate_doctor_appointments_count

  private

  def validate_doctor_appointments_count
    errors.add(:doctor, 'is too busy') if doctor && doctor.appointments.pending.size >= 10
  end
end
