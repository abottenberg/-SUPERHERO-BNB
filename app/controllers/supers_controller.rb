class SupersController < ApplicationController
  
  def new
    @user = current_user
    @super = Super.new
  end

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
end
