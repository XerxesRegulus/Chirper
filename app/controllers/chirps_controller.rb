class ChirpsController < ApplicationController
  before_action :set_chirp, only: [:destroy]

  def index
    @chirps = Chirp.all
  end

  def new
    @chirp = Chirp.new
  end

  def create
    @chirp = Chirp.new chirp_params
    @chirp.user = current_user
    if @chirp.save
      redirect_to chirps_path
      flash[:success] = "Chirp Created Successfully"
    else 
      flash[:error] = @chirp.errors.to_sentence
      render :new
    end
  end

  def destroy
    if @chirp.destroy
      redirect_to chirps_path
      flash[:success] = "Chirp Destroyed Successfully"
    else
      flash[:error] = @chirp.errors.to_sentence
      redirect_to chirps_path
    end
  end 
  private
  def set_chirp
    @chirp = Chirp.find(params[:id])
  end
  def chirp_params
    params.require(:chirp).permit(:user_id, :content)
  end
end
