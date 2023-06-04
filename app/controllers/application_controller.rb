class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :deny_access
  rescue_from ActiveRecord::RecordNotFound, with: :deny_access

  private

  def deny_access(exception)
    redirect_back_or_to(root_path, alert: exception.message)
  end

  def current_ability
    if current_doctor
      @current_ability ||= DoctorAbility.new(current_doctor)
    elsif current_patient
      @current_ability ||= PatientAbility.new(current_patient)
    end
  end
end
