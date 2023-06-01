module Patients
  class DoctorsController < ApplicationController
    before_action :authenticate_patient!
    authorize_resource

    def index
      @doctors = Doctor.preload(:category).decorate
      @doctor_categories = DoctorCategory.all
    end
  end
end
