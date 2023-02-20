class Api::V1::UsersController < ApplicationController
  def index
    users = User.all.order(created_at: :desc)
    render json: users, status: 200
  end

  def show
    if user
      render json: user
    else
      render json: {}, status: 404
    end
  end

  def user_info
    3.times {puts "#####################USER INFO####################"}
    puts user_signed_in?
    puts current_user.inspect
    if user_signed_in?
      3.times {puts "@@@@@@@@@@@@@@@@@@@@"}
      puts current_user.inspect
      3.times {puts "@@@@@@@@@@@@@@@@@@@@"}
      render json: current_user
    else
      render json: {}, status: 401
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end
end
