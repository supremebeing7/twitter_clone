class TweetsController < ApplicationController

def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if params[:tweet]
      @tweet.update(tweets_params)
    end
    redirect_to tweet_path
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      flash[:notice] = "tweet created!"
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to(root_path)
  end

private

  def tweets_params
    params.require(:tweet).permit(:tweetname, :password, :password_confirmation, :auth_token, :email)
  end
end
