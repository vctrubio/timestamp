class UsersController < ApplicationController
  before_action :find_user, only: [:show, :following, :followers, :follow, :unfollow]

  def index
    if params[:query].present?
      @users = User.user_search(params[:query]).order(name: :asc)
    end
    @users = [] unless @users
  end

  def show
    @events = @user.events.order(end_time: :asc)
    authorize @user
  end

  def following
    authorize @user

    @following = @user.following
  end

  def followers
    authorize @user

    @followers = @user.followers
  end

  def follow
    authorize @user
    current_user.follow(@user) if !current_user.following?(@user)
  end

  def unfollow
    authorize @user
    current_user.unfollow(@user) if current_user.following?(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end



