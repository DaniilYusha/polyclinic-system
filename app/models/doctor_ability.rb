class DoctorAbility
  include CanCan::Ability

  def initialize(doctor)
    return unless doctor

    can :show, :profile
    can(:read, Appointment, doctor:)
    can :create, Recommendation
  end
end
