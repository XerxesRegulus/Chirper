class Api::V1::FollowingsController < Api::V1::ApplicationController
  respond_to :json
  before_action :set_user, only: [:index]

  def index
    respond_with Follower.all
  end

  private
  def set_user
    # @user = User.find(params[:id])
  end
end
