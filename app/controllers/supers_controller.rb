class SupersController < ApplicationController
  before_action :set_super, only: [:show, :edit, :update]

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
    @user = current_user
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

  private

  def super_params
    params.require(:super).permit(:name, :location, :good, :photos)
  end

  def set_super
    @super = Super.find(params[:id])
  end
end
