class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new
    @tweet.text = params[:tweet][:text]
    @tweet.save

    render json: 'Tweet created successfuly.'.to_json , content_type: "application/json", status: 200
  end

  def index
    render json: Tweet.all, content_type: "application/json", status: 200
  end

  def update
    @tweet = Tweet.find(params[:id])

    @tweet.text = params[:text]
    @tweet.save

    render json: 'Tweet updated successfuly.'.to_json , status: 200
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    render json: 'Tweet deleted successfuly.'.to_json , status: 200
  end
end
