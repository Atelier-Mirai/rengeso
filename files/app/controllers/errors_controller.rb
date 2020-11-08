# https://qiita.com/mknstone/items/d027070ed0d004ffc993
class ErrorsController < ApplicationController
  layout 'application'

  rescue_from StandardError,                  with: :internal_server_error
  rescue_from ActionController::RoutingError, with: :not_found
  rescue_from ActiveRecord::RecordNotFound,   with: :not_found

  def show
    raise
  end

  def not_found(exception = nil)
    render template: 'application/not_found', status: 404
  end

  def internal_server_error(exception = nil)
    render template: 'application/internal_server_error', status: 500
  end
end
