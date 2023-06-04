module Patients
  class ProfileController < ApplicationController
    before_action :authenticate_patient!
    authorize_resource class: false

    def show
      @current_patient = current_patient.decorate
    end
  end
end
