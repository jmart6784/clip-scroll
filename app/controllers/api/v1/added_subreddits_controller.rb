class Api::V1::AddedSubredditsController < ApplicationController
  def mine
    addedsubreddits = current_user.added_subreddits.order('subreddit')
    render json: addedsubreddits, status: 200
  end

  def create
    
  end
end
