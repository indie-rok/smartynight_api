class ContactController < ApplicationController
	def index
		@contacts = Contact.all
	end
	def show
		@contact = Contact.find(params[:id])
		@topic = Topic.find(@contact.topic_id).title
	end
	def new
		@contact = Contact.new
		@topics = Topic.all
	end
	
	def create
		@contact = Contact.new(contact_params)
		if @contact.save			
			# Llamamos al ActionMailer que creamos
		  	UserMailer.contact_email(@contact).deliver
		  	redirect_to @contact
		else
			render 'new'
		end
	end
	private
	def contact_params
		params.require(:contact).permit(:topic_id, :name, :email, :message)
	end
end
