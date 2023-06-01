module Doctors
  class AppointmentsController < ApplicationController
    before_action :authenticate_doctor!
    authorize_resource

    def index
      @appointments = current_doctor.appointments.preload(:patient, :recommendation)
    end
  end
end
