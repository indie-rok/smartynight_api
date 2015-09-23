class Api::VenuesController < ApplicationController

  #remove in production
  skip_before_filter :verify_authenticity_token

  #before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues =  Venue.all

    render :json => @venues,
          :methods => [:average_rating,:user_count ,:avatar_picture],
          :include => :venue_photos
  end

  # GET /venues/1
  # GET /venues/1.json
  def show

    @venue =  Venue.find(params[:id])
    render :json => @venue, 
          :methods => [:average_rating,:user_count],
          :include => [:venue_photos,:parties]
  end

  # GET /venues/new
  def new
    #render view in user controller
  end

  # GET /venues/1/edit
  def edit
    #render view in user controller
  end

  # POST /venues
  # POST /venues.json
  def create
    #create venues trought users controller
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    #update venues trought users controller

    @user = User.find_by(authentication_token: request.headers['Authorization'])

    if @user.is_venue?
      @user.venue.update(venue_params)
      if @user.venue.update(venue_params)
        render json: {status: :ok}
      else
        render json: {msg: 'Invalid params'}
      end
    else
      render json: {msg: 'You dont own a venue'}, status: :error
    end
    

  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    #delete venues trought users controller
  end

  private

  def venue_params
       params.permit(
                                :name,
                                :phone,
                                :city,
                                :state,
                                :zip_code,
                                :street_address,
                                :dresscode,
                                :popular_drink,
                                :best_for,
                                :url ,
                                :music_genre ,
                                :live,
                          )
    end

end
