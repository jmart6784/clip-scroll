class Api::V1::AddedSubredditsController < ApplicationController
  def mine
    added_subreddits = current_user.added_subreddits.order('subreddit')
    render json: added_subreddits, status: 200
  end

  def create
    existing_addition = AddedSubreddit.find_by(subreddit: added_subreddit_params[:subreddit], user_id: current_user.id)

    # If added subreddit exists create it else delete it
    if existing_addition.nil?
      added_subreddit = AddedSubreddit.new(added_subreddit_params)
      added_subreddit.user_id = current_user.id

      if added_subreddit.save
        render json: added_subreddit
      else
        render json: added_subreddit.errors, status: 422
      end
    else
      existing_addition.destroy
      render json: {message: "subreddit removed"}
    end
  end

  private

  def added_subreddit_params
    params.require(:added_subreddit).permit(:subreddit)
  end
end
