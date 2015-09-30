class Api::ClaimsController < ApplicationController

	#remove in production
 	skip_before_filter :verify_authenticity_token


 	def index
 		@venues = Venue.where user_id: nil
 		render json: @venues
 	end

	def create
		@venue  = Venue.find(params[:id])

		if @venue.user_id.nil?
			u = User.new
			u.email = params[:email]
			u.password = params[:password]
			u.user_type = 'venue'
			u.wants_newsletter = true
			u.verified = false
			u.save

			if u.save
				@venue.user_id = u.id
				@venue.save
				render json: {msg: 'Claimed'}
			else
				render json: {msg: u.errors}
			end

		else
			render json: {msg: 'Venue already assigned'}
		end
	end
end
