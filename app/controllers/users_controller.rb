class UsersController < ApplicationController

def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user]
      @user.update(users_params)
    end
      redirect_to user_path
  end

  def create
    @user = User.new(users_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      flash[:notice] = "User created!"
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path)
  end

private

  def users_params
    params.require(:user).permit(:username, :password, :password_confirmation, :auth_token, :email)
  end
end
