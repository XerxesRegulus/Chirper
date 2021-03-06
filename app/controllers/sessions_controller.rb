class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          userId: user.id,
          username: user.username
        }
        render json: data, status: 201 and return
      end
    end
  end
end
