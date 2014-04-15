class RelationshipsController < ApplicationController

def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
    @relationship = Relationship.new(relationships_params)
    if @relationship.save
      redirect_to user_path(@relationship.followed_id)
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

  def relationships_params
    params.require(:relationship).permit(:followed_id, :follower_id)
  end
end
