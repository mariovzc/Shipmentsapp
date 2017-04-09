class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #2before_action :require_login
  
  private
  def not_authenticated
    flash[:warning] = 'You have to authenticate to access this page.'
    redirect_to home_index_url
  end
end
