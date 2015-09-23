class Api::SearchesController < ApplicationController

	def index

		if params[:model] == 'venues'
			@results = Venue.filter_by_name(params[:name])
		elsif params[:model] == 'events'
			@results = Party.filter_by_name(params[:name])
		elsif params[:model] == 'cities'
			@results = Venue.where(city: params[:name])
		end

		render json: @results

	end
end
