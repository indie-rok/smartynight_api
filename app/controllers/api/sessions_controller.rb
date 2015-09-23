class Api::SessionsController < ApplicationController
	#remove in production
	skip_before_filter :verify_authenticity_token, :only => :create  
 	
 	def create
    user_password = params[:password]
    user_email = params[:email]
    user = user_email.present? && User.find_by(email: user_email)

	    if user.valid_password? user_password
	      #sign_in user, store: false
	      user.authentication_token = Devise.friendly_token
	      user.save
	      render json: {authentication_token: user.authentication_token,type: 'email'}, status: 200, location: 'http://google.com'
	    else
	      render json: { errors: "Invalid email or password" }, location: 'http://google.com'
	    end
	end

end
