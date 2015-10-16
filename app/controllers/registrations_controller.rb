class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json
  before_action :configure_permitted_parameters

  def create
    respond_with :api, :v1, User.create(sign_up_params)
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
