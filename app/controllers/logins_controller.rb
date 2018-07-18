class LoginsController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      user.api_key ||= SecureRandom.uuid
      user.save!
      render json: {
        response: 'SUCCESS',
        message: "",
        api_key: user.api_key
      }
    else
      render json: {
        response: 'ERROR',
        message: "Invalid username/password combination",
      }, status: :unauthorized
    end
  end
end
