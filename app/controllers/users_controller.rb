class UsersController < ApplicationController
  before_action :find_user, only: [:show, :following, :followers, :follow, :unfollow]

  def show
  end

  def following
    @following = @user.following
  end

  def followers
    @followers = @user.followers
  end

  def follow
    current_user.follow(@user) if !current_user.following?(@user)
  end

  def unfollow
    current_user.unfollow(@user) if current_user.following?(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end



