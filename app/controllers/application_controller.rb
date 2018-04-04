class ApplicationController < ActionController::Base
  require 'csv'
  protect_from_forgery with: :exception

   before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def sign_in
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

end
