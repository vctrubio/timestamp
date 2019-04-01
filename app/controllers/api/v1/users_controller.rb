class Api::V1::UsersController < Api::V1::BaseController
  def index
    if (params[:query][0] == "@")
      @users = policy_scope(User.user_search(params[:query]))
      @names = @users.map do |user|
        user.username
      end
    else
      @users = []
    end
  end
end
