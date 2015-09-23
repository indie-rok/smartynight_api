class Api::OmniauthCallbacksController < ApplicationController

	def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)

    #render json: request.env["omniauth.auth"] 
	
	@user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      #sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    	render json: {authentication_token: @user.dancer.facebook_token, type:'facebook'}, status: 200
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      warden.custom_failure!
      render json: {error:'Invalid request '}, status: 401	
    end
  end

end