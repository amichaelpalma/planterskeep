class PlantsController < ApplicationController

  before_action :set_plant, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @plants = Plant.with_attached_image
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    if @plant.save
      flash[:success] = 'A new plant has been added to your inventory.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      flash[:notice] = 'Plant details updated.'
      redirect_to plant_path(@plant)
    else
      render 'edit'
    end
  end

  def destroy
    @plant.destroy
    flash[:alert] = 'Plant was successfully deleted.'
    redirect_to root_path
  end


  private

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :description, :image)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end