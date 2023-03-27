class Api::V1::AddedSubredditsController < ApplicationController
  def mine
    addedsubreddits = current_user.addedsubreddits.order('subreddit')
    render json: addedsubreddits, status: 200
  end
end
