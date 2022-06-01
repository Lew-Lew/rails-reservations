class CoworkingsController < ApplicationController
  def index
    @coworkings = Coworking.all
  end

  def show
    @coworking = Coworking.find(params[:id])
  end

  def new
    @coworking = Coworking.new
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    if @coworking.save
      redirect_to coworking_path(@coworking)
    else
      render :new
    end
  end

  def edit
    @coworking = Coworking.find(params[:id])
  end

  def update
    @coworking = Coworking.find(params[:id])
    @coworking.update(coworking_params)
    redirect_to coworking_path(@coworking)
  end

  def destroy
    @coworking = Coworking.find(params[:id])
    @coworking.destroy
    redirect_to coworkings_path
  end

  private

  def coworking_params
    params.require(:coworking).permit(:name, :address, :price_per_hour, :description)
  end
end
