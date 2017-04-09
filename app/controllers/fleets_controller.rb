class FleetsController < ApplicationController
  before_action :set_fleet, only: [:show, :edit, :update, :destroy]

  def index
      @fleets = Fleet.all
  end

  def show
  end

  def new
    @fleet = Fleet.new
  end

  def edit
  end

  #def fleets_by_city
      #@fleet = Fleet.where(city_id: params[:id])
      #render json: 1, status: :ok
  #end

  def create
    @fleet = Fleet.new(fleet_params)

    respond_to do |format|
      if @fleet.save
        format.html { redirect_to :fleets, flash[:success] = 'Flota Creada' }
        format.json { render :show, status: :created, location: @fleet }
      else
        format.html { render :new }
        format.json { render json: :fleets.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fleet.update(fleet_params)
        format.html { redirect_to :fleets, notice: 'Fleete Actualizado Correctamente' }
        format.json { render :show, status: :ok, location: @fleet }
      else
        format.html { render :edit }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy    
    @fleet = Fleet.find(params[:id])
    @fleet.destroy
    respond_to do |format|
      format.html { redirect_to :fleets }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

    private
    def set_fleet
      @fleet = Fleet.find(params[:id])
    end

    def fleet_params
      params.require(:fleet).permit(:name, :city_id)
    end
end
