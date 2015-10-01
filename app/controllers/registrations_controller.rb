class RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_permitted_parameters

  def create
    @user = User.new sign_up_params
    if @user.save
      flash[:success] = "Signed Up Successfully"
      redirect_to chirps_path
    else
      flash[:error] = "Oh noes! something went wrong"
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:username, :email, :password)
    devise_parameter_sanitizer.for(:account_update).push(:username, :email, :password)
  end

end