class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    @farms = Farm.all
    @form_title = "Farm Index Page"
    @form_myflat = false
    @farms = Farm.where.not(latitude: nil, longitude: nil)

    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: { content: render_to_string(partial: "/farms/map_box", locals: { farm: farm }) }
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    @booking = Booking.new
  end

  def myfarms
    @farms = Farm.where(user: current_user)
    @form_title = "My farms"
    @form_myflat = true

     @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: { content: render_to_string(partial: "/farms/map_box", locals: { farm: farm }) }
      }
    end
    render :index
  end

  def new
    @farm = Farm.new
    @user = current_user
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user
    if @farm.save
      redirect_to farms_path
    else
      render 'farms/new'
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name, :description, :location, :city, :country, :price, :photo)
  end

  def set_farm
    @farm = Farm.find(params[:id])
  end
end
