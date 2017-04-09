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
    #{"email"=>"c@c.com", "password"=>"123", "password_confirmation"=>"123", "first_name"=>"asda", "last_name"=>"asd", "role"=>"1"}
    asdasd
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to :packages, flash[:success] = 'paquete creado'  }
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
      params.require(:package).permit(:user_id, :order_status_id, :bus_id, :current_lat, :current_lng, :description, :origin_id, :destination_id, :weight)
    end
end
