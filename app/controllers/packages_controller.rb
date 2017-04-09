class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
      @packages = Package.all
  end

  def show
  end

  def new
    @package = Package.new
  end

  def edit
  end
  def create
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
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to :packages, notice: 'paquete Actualizado Correctamente' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy    
    @package = Package.find(params[:id])
    @package.destroy
    respond_to do |format|
      format.html { redirect_to :packages }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

    private
    def set_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:user_id, :order_status_id, :bus_id, :current_lat, :current_lng, :description, :origin_id, :destination_id, :weight)
    end
end
