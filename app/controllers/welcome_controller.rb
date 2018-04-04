class WelcomeController < ApplicationController
  before_action :sign_in

	def calendar

	end

private
  def sign_in
	   if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
     end
end

end
