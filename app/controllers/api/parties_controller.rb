	class Api::PartiesController < ApplicationController

	#remove in production
  	skip_before_filter :verify_authenticity_token

  	before_action :set_user, only: [:create,:show, :edit, :update, :destroy,:new]

	def index
		@parties = Party.where(status:'published')
		render :json => @parties.to_json(:include => { :venue => { :only => [:name] } })
	end

	def new
		render :json => @user, only: [:avatar_url,:email],
		:include => { :venue => {:include => :parties ,:only => :venue } }
	end

	def create

		p = Party.new
		p.img_url = params[:img_url]
		p.name = params[:name]
		p.type = params[:type]
		p.date = params[:date]
		p.start_time = params[:start_time]
		p.end_time = params[:end_time]
		p.cover = params[:cover]
		p.description = params[:description]
		p.status = params[:status]
		p.venue_id = @user.id
		p.save

		if p.save
			render json: {msg: 'Created'}
		else
			render json: {error: p.errors}
		end
	end

	def show
		@party = Party.find(params[:id])
		render json: @party.to_json(:include => { :venue => { :only => [:name] } })
	end

	def update
		@party = @user.venue.parties.find(params[:id])
		if @party.exists?
			@party.update(party_params)
		else
			render json:{error: 'You cant edit this party'}
		end
	end

	def destroy

		@party = @user.venue.parties.find(params[:id])

		if @party.destroy
			render json:{msg: 'Party deleted!'}
		else
			render json:{error: 'Error'}
		end
	end

	private

	def set_user
    	#to do
    	#if cookie authentication_token type facebook

    	#elsif cookie authentication_token type email

    	#end
    		
    	user = User.find_by(authentication_token: request.headers['Authorization'])

    	if user.is_venue?
    		@user = user
    	else
    		render json:{error: 'You cant trow parties'}
    	end
    end

    def party_params
    	params.permit(
    			:img_url,
    			:name,
    			:type,
    			:date,
    			:start_time,
    			:end_time,
    			:cover,
    			:description,
    			:status
    		)
    end

end
