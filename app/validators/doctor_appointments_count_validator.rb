class DoctorAppointmentsCountValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:doctor, :busy) if record.doctor.appointments.count >= Doctor::MAX_APPOINTMENTS_COUNT
  end
end
