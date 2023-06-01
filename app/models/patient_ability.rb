class PatientAbility
  include CanCan::Ability

  def initialize(patient)
    return unless patient

    can :show, :profile
    can(%i[read create], Appointment, patient:)
    can :read, Doctor
  end
end
