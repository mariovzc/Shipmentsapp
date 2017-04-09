class AdminController < ApplicationController
  def index
    @cities = City.all
    @fleets = Fleet.all
  end
end
