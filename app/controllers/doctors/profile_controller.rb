module Doctors
  class ProfileController < ApplicationController
    before_action :authenticate_doctor!
    authorize_resource class: false

    def show
      @current_doctor = current_doctor.decorate
    end
  end
end
