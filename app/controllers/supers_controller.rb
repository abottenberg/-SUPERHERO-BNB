class SupersController < ApplicationController
  before_action :set_super, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_user, only: [:new, :create]

  def index
    if params[:superhero].present?
      if params[:superhero] == "true"
        @supers = Super.where(good: true).order(:cached_votes_score => :desc)
      else
        @supers = Super.where(good: false).order(:cached_votes_score => :desc)
      end
    else
      @supers = Super.all.order(:cached_votes_score => :desc)
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

  def upvote
    @super = Super.find(params[:id])
    @super.upvote_from current_user
    @super.save
    redirect_back fallback_location: supers_path
  end

  def downvote
    @super.downvote_from current_user
    redirect_back fallback_location: supers_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_super
    @super = Super.find(params[:id])
  end

  def super_params
    params.require(:super).permit(:name, :location, :good, :photo, :description, :quote)
  end
end
