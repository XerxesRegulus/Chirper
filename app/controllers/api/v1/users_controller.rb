class Api::V1::UsersController < Api::V1::ApplicationController
  respond_to :json
  
  def show
    respond_with user
  end

  private
  def user
    User.find(params[:id])
  end
end
