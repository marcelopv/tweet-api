class TweetsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  http_basic_authenticate_with name: "username", password: "password", except: [:index, :show]

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save

    render_json_ok_message('Tweet created successfuly.')
  end

  def index
    render_json_ok_message(Tweet.all)
  end

  def update
    @tweet = Tweet.find(params[:id])

    if(@tweet.update(tweet_params))
      render_json_ok_message('Tweet updated successfuly.')
    else
      render_json_ok_message('Tweet was not updated successfuly.')
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    render_json_ok_message(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    render_json_ok_message('Tweet deleted successfuly.')
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def render_json_ok_message(message)
    render json: message.to_json , content_type: "application/json", status: :ok
  end
end
