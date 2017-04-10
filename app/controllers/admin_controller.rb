class AdminController < ApplicationController
  def index
    city = City.all
    arr = []
    city.each do |c|
      if c.fleet == nil        
        arr.push(c)        
      end
   end
    @cities = arr
    @fleets = Fleet.all
    @buss = Bus.all
    @users = User.all
    @packages = Package.all
    @status = OrderStatus.all
  end
end
