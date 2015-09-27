class Api::UsersController < ApplicationController

	#remove in production
	skip_before_filter :verify_authenticity_token

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	respond_to :json

	#before_action :authenticate_with_token!, only: [:update, :destroy]

	def index
		#render all venue or dancer in venues or dancer controller
	end

	#GET /user/id
	def show
		render :json => @user,  :only => [:email, :gender,:age_range,:avatar_url],
		:include => { :recent_searches => {:include => :venue ,:only => :venue } }
	end

	#POST /user
	def create

		user = User.where(:email => params[:email] ).first_or_create do |user|
			user.password = params[:password]
			user.verified = false 
			user.wants_newsletter = true
			user.user_type = params[:user_type]

			if params[:user_type] == 'venue'
				user.create_venue(
					name: params[:venue_name],
					venue_type: params[:venue_type],
					street_address: params[:venue_street_address],
					city: params[:venue_city],
					state: 'california',
					zip_code: params[:venue_zip],
					phone: params[:venue_phone]
				)
			elsif params[:user_type] == 'dancer'
				user.create_dancer(
					username: params[:dancer_username],
					gender: params[:dancer_gender],
					age_range: params[:dancer_age_range]
				)
			end

			user.authentication_token = Devise.friendly_token
			@created = true
		end

		if @created
			render json: {status: 'created', authentication_token: user.authentication_token ,type: 'email', location: 'user'}
		else
			render json: {status:'error', location: 'login', error:'User exists'}
		end
		
	end

	#PATCH /user/id

	def update
		#to edit venue or dancer details go to venue or dancer controller
		#here I just edit user details
		@user.update(user_params)
 		if @user.update(user_params)
 			render json: {status: :ok}
 		else
 			render json: {status: :error}
 		end
	end

	def destroy
		#ask if destroy account is permited
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	#to do
    	#if cookie authentication_token type facebook

    	#elsif cookie authentication_token type email

    	#end
    		
    	@user = User.find_by(authentication_token: request.headers['Authorization'])
    end

    def user_params
       params.permit(
       		:avatar_url,
       		:password,
       		:wants_newsletter
       	)
    end

end