class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new
    @tweet.text = params[:tweet][:text]
    @tweet.save

    render json: 'Tweet created successfuly.'.to_json , content_type: "application/json", status: 200
  end

end
