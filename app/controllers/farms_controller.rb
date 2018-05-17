class FarmsController < ApplicationController
before_action :set_farm, only: [:show, :edit, :update, :destroy]
def index
  @farms = Farm.all
end
def set_farm
  @farm = Farm.find(params[:id])

end
end
