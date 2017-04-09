class AdminController < ApplicationController
  def index
    @cities = City.all
  end
end
