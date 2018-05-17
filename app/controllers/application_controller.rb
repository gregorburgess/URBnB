class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  before_action :authenticate_user!
end
