class Api::V1::UserConfigurationsController < ApplicationController
  def mine
    render json: current_user.user_configuration
  end
end
