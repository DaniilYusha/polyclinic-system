class AppointmentStatusTransitionValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:status, :reopen) if record.attribute_changed?(:status) && record.pending?
  end
end
