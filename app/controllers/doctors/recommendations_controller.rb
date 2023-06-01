module Doctors
  class RecommendationsController < ApplicationController
    before_action :authenticate_doctor!
    load_and_authorize_resource :appointment
    load_and_authorize_resource :recommendation, through: :appointment, singleton: true

    def new; end

    def create
      return render(:new) unless @recommendation.save

      redirect_to(appointments_path, notice: t('.recommendation_created'))
    end

    private

    def recommendation_params
      params.require(:recommendation).permit(:content)
    end
  end
end
