class Api::V1::SubredditsController < ApplicationController
  def index
    subreddits = Subreddit.all.order('subreddit')
    render json: subreddits, status: 200
  end
end
