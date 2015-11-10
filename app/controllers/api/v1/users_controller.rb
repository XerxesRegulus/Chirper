class Api::V1::UsersController < Api::V1::ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      respond_with user
    end
  end

  def followers
    respond_with @user.followers
  end
  
  private
  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:chirp).permit(:email, :username, :password)
  end
end
