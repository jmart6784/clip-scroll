class Api::V1::UserConfigurationsController < ApplicationController
  before_action :check_api_limit, only: [:mine]

  def mine
    render json: current_user.user_configuration
  end
end

private

def check_api_limit
  uc = current_user.user_configuration
  date_valid = false

  # Restrict Shorts API call daily limit to 5 requests per day
  unless uc.youtube_refresh_date.nil?
    # Has a day passed?
    date_valid = uc.youtube_refresh_date + 1.day < DateTime.now.utc

    # If date is valid (a day has passed) and the refresh limit is 0, set as 5.
    if date_valid && uc.youtube_channel_refresh_limit === 0
      uc.update(youtube_channel_refresh_limit: 5)
    end
  else
    # Update refresh date to now if refresh date is nil
    uc.update(youtube_refresh_date: DateTime.now.utc)
    date_valid = true
  end
end