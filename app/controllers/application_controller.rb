class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # ApplicationController
 
 #<-----This is for 503 error---->
#before_filter :return_unavailable_status

#private
  #def return_unavailable_status
    #render 'errors/underconstruction', layout: 'layouts/application_coming', :status => :underconstruction
  #end

  include Authenticable
  
  protect_from_forgery with: :exception
  
end
