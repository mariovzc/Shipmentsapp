class BusController < ApplicationController
  respond_to :json
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  def index
      @buss = Bus.all
      render json: @buss
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
      if @bus.save
        render json: @bus, status: :created
      else
        render json: @bus.errors, status: :unprocessable_entity
      end
  end

  def update
    if @bus.update(bus_params)
      render json: @bus, status: :created
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  def destroy    
    @bus = Bus.find(params[:id])
    @bus.destroy
    render json: "ok".to_json, status: 202
  end

    private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:license_plate, :fleet_id)
    end

end
