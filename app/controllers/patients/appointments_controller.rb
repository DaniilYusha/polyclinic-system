module Patients
  class AppointmentsController < ApplicationController
    before_action :authenticate_patient!
    before_action :load_doctors, only: %i[new create]
    load_resource only: %i[new create]
    authorize_resource

    def index
      @appointments = current_patient.appointments.preload(:doctor, :recommendation)
    end

    def new; end

    def create
      return render(:new) unless @appointment.save

      redirect_to(appointments_path, notice: t('.appointment_created'))
    end

    private

    def load_doctors
      @doctors = Doctor.all.decorate
    end

    def appointment_params
      params.require(:appointment).permit(:datetime, :doctor_id)
    end
  end
end
