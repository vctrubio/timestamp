class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :following, :followers, :follow, :unfollow ]

  def index
    policy_scope(User)
    if params[:query].present?
      @users = User.user_search(params[:query]).order(name: :asc)
    end
    if @users
      authorize(@users)
    else
      @users = []
    end
  end

  def show
    authorize @user
    @events = @user.events.order(start_time: :desc)
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        image_url: helpers.asset_url('logomark.png')
      }
    end
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
