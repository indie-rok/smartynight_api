class Api::DancersController < ApplicationController

	#remove in production
	skip_before_filter :verify_authenticity_token

	def show

    	@dancer =  Dancer.find(params[:id])
    	render :json => @dancer

  	end


	def update
		@user = User.find_by(authentication_token: request.headers['Authorization'])

	    if @user.is_dancer?
	      @user.dancer.update(dancer_params)
	      if @user.dancer.update(dancer_params)
	        render json: {status: :ok}
	      else
	        render json: {msg: 'Invalid params'}
	      end
	    else
	      render json: {msg: 'You are not a Dancer'}, status: :error
	    end
	end

	def dancer_params
       params.permit(
       		:gender,
       		:age_range,
       	)
    end

end
