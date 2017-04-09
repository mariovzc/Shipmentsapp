class HomeController < ApplicationController
  #skip_before_action :require_login
  def index
    @packages = Package.all
  end
end
