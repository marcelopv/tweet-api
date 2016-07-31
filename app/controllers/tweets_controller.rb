class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save

    render json: 'Tweet created successfuly.'.to_json , content_type: "application/json", status: 200
  end

  def index
    render json: Tweet.all, content_type: "application/json", status: 200
  end

  def update
    @tweet = Tweet.find(params[:id])

    if(@tweet.update(tweet_params))
      render json: 'Tweet updated successfuly.'.to_json , status: 200
    else
      render json: 'Tweet was not updated successfuly.'.to_json , status: 200
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    render json: 'Tweet deleted successfuly.'.to_json , status: 200
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
