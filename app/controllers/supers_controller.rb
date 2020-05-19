class SupersController < ApplicationController
  before_action :set_super, only: [:show]

  def show
  end

  private

  def set_super
    @super = Super.find(params[:id])
  end
end
