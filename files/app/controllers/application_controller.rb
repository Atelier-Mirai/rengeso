class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :error

  if Rails.env.production?
    rescue_from Exception, with: :error500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404
  end

  private

  def error404(_e)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(_e)
    render 'error500', status: 500, formats: [:html]
  end
end
