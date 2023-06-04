class Appointment < ApplicationRecord
  include ActiveModel::Validations
  enum status: { pending: 0, closed: 1 }

  belongs_to :doctor
  belongs_to :patient

  has_one :recommendation, dependent: :destroy

  validates :datetime, presence: true
  validates_with DoctorAppointmentsCountValidator, on: :create
  validates_with AppointmentStatusTransitionValidator, on: :update
end
