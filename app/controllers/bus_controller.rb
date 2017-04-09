class BusController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  def index
      @buss = Bus.all
  end

  def show
  end

  def new
    @bus = Bus.new
  end

  def edit
  end
  def create
    @bus = Bus.new(bus_params)

    respond_to do |format|
      if @bus.save
        format.html { redirect_to :buss, flash[:success] = 'Bus creado'  }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: :buss.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to :buss, notice: 'Buse Actualizado Correctamente' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy    
    @bus = Bus.find(params[:id])
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to :buss }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

    private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:license_plate, :fleet_id)
    end

end
