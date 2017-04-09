class AdminController < ApplicationController
  def index
    @cities = City.all
    @fleets = Fleet.all
    @buss = Bus.all
    @users = User.all
    @packages = Package.all
  end
end
