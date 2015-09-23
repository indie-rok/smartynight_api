class Api::EmailsController < ApplicationController

	#remove in production
	skip_before_filter :verify_authenticity_token

	def contact_email
		UserMailer.contact_email(params).deliver_now
	end
end