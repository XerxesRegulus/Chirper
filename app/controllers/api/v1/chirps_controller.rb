class Api::V1::ChirpsController < ApplicationController
  respond_to :json

  def index
    respond_with Chirp.all
  end

  def create
    respond_with :api, :v1, Chirp.create(chirp_params)
  end

  def destroy
    respond_with chirp.destroy
  end 

  private
  def chirp
    Chirp.find(params[:id])
  end

  def chirp_params
    params.require(:chirp).permit(:user_id, :content)
  end
end
