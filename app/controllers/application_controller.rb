class ApplicationController < ActionController::API
  def authenticate_user
    api_key = params[:api_key]
    @curr_user = User.find_by_api_key(api_key);
  end
end
