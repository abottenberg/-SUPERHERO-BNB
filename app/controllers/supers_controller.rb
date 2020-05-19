class SupersController < ApplicationController
  before_action :set_super, only: [:show]

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
  
  private

  def set_super
    @super = Super.find(params[:id])
  end
end
