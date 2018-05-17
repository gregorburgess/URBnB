class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    @farms = Farm.all
  end

  def new
    @farm = Farm.new
    @user = current_user
  end

  def create
    farm = Farm.new(farm_params)
    farm.user = current_user
    if farm.save
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
