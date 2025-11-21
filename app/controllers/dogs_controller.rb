class DogsController < ApplicationController
  before_action :set_dog, only: [ :show, :edit, :update, :destroy ]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = current_user.dogs.build(dog_params)
    if @dog.save
      redirect_to @dog, notice: "Dog created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: "Dog updated!"
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, notice: "Dog deleted!"
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :size, :energy_level, :photo)
  end
end
