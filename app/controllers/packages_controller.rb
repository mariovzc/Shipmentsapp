class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
      @packages = Package.all
      render json: @packages
  end

  def show
  end

  def new
    @package = Package.new
    @cities = City.all
  end

  def edit    
  end
  def create
    user = User.where(document: params[:document])[0]
    token = 1.upto(7).map { [*'0'..'9', *'a'..'z'].sample }.join
    if user.blank?
      user = User.new(email: token + "@fake.com", 
                      password: 123,
                      password_confirmation: 123, 
                      first_name: params[:first_name], 
                      last_name: params[:last_name], 
                      role: 2,
                      document: params[:document]
                       ) #normal user role
      user.save
    end
    
    #{"email"=>"c@c.com", "password"=>"123", "password_confirmation"=>"123", "first_name"=>"asda", "last_name"=>"asd", "role"=>"1"}
    @package = Package.new(package_params)
    @package.user = user
    @package.order_status_id = 1
    @package.trackingid = token

    respond_to do |format|
      if @package.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: :packages.errors, status: :unprocessable_entity }
      end
    end   
  end

  def update
      if @package.update(package_params)
        render json: @package, status: :created
      else
        render json: @package.errors, status: :unprocessable_entity
      end
  end

  def destroy    
    @package = Package.find(params[:id])
    @package.destroy
    render json: "ok".to_json, status: 202
  end

    private
    def set_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:user_id, :order_status_id, :bus_id, :longitude, :latitude, :description, :origin_id, :destination_id, :weight, :raw_address)
    end
end
