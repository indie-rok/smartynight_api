class Api::LikesController < ApplicationController

	#remove in production
	skip_before_filter :verify_authenticity_token


	before_action :set_user, only: [:create, :destroy,:index]

	def index
		render json: @user.dancer.likes
	end

	def create

		if @user.is_venue?
			return render json: {msg: 'You cant rate venues'}
		end

		likeExists = Like.where(dancer_id: @user.dancer.id, venue_id: params[:venue_id]).exists?

		if likeExists
			render json: {msg: 'Cant rate twice a venue'}
		else
			Like.create(
				dancer_id: @user.dancer.id,
				venue_id: params[:venue_id]
			)

			render json: {msg: 'Ok'}
		end

	end

	def destroy
		@user.dancer.likes.find_by(venue_id: params[:venue_id]).destroy
		render json:{msg: 'Ok'}
	end


	private
	def set_user
    	#to do
    	#if cookie authentication_token type facebook

    	#elsif cookie authentication_token type email

    	#end
    	
    	@user = User.find_by(authentication_token: request.headers['Authorization'])

    end
end
