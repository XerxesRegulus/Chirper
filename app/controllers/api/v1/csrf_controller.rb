class Api::V1::CsrfController < Api::V1::ApplicationController
  def index
    render json: { request_forgery_protection_token => form_authenticity_token }.to_json
  end
end
