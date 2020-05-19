class SupersController < ApplicationController

  def new
    @user = current_user
    @super = Super.new
  end


end
