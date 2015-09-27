class Api::SessionsController < ApplicationController
	#remove in production
	skip_before_filter :verify_authenticity_token, :only => :create  
 	
 	def create
    user_password = params[:password]
    user_email = params[:email]

    user = user_email.present? && User.find_by(email: user_email)

    	if user.nil?
    		render json: {errors:'User does not exists', location: 'login'}
    		return
    	end

	    if user.valid_password? user_password
	      #sign_in user, store: false
	      user.authentication_token = Devise.friendly_token
	      user.save
	      render json: {authentication_token: user.authentication_token,type: 'email', location: 'user'}, status: 201
	    else
	      render json: { errors: "Invalid password",location:'login' }
	    end
	end

end
