class ErrorsController < ApplicationController
  def error404
    render layout: 'layouts/application_coming', status: :not_found
  end
end
