class SupersController < ApplicationController
  before_action :set_super, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
      if params[:superhero].present?
        if params[:superhero] == "true"
          @supers = Super.where(good: true)
        else
          @supers = Super.where(good: false)
        end
      else
        @supers = Super.all
      end
  end

  def show
  end

  def new
    @super = Super.new
  end

  def edit
  end

  def update
    if @super.update(super_params)
      redirect_to @super, notice: 'Superhero was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @super = Super.new(super_params)
    @super.user = current_user
    if @super.save
      redirect_to super_path(@super)
    else
      render :new
    end
  end

  def destroy
    @super.destroy
    redirect_to supers_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_super
    @super = Super.find(params[:id])
  end

  def super_params
    params.require(:super).permit(:name, :location, :good, :photo, :description)
  end
end
