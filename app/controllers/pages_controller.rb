class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @farms = Farm.all.first(10)
  end

end
