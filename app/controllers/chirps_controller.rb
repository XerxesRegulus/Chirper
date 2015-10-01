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
    @chirp.user_id = current_user.id
    if @chirp.save
      flash[:success] = @chirp.errors.full_messages
      redirect_to chirps_path
    else
      flash[:error] = @chirp.errors.full_messages
      render :new
    end
  end

  def destroy
    if @chirp.destroy
      flash[:success] = "Deleted"
      redirect_to chirps_path
    else
      flash[:error] = @chirps.errors.full_messages.to_sentence
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
