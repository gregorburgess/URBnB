class FarmsController < ApplicationController

  def new
    @farm = Farm.new
    @user = current_user
  end

  def create
    farm = Farm.new(farm_params)
    farm.user = current_user
      if farm.save
      redirect_to root_path
    else
      render 'farms/new'
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name, :description, :location, :city, :country, :price)
  end
end
