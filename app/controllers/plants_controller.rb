class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      flash[:success] = 'A new plant has been added to your inventory.'
      redirect_to root_path
    else
      render 'new'
    end
  end
  

  private

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :description)
end