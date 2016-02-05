class CatsController < ApplicationController
  before_action :validate_cat_owner, only: [:edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "Thanks for keeping #{@cat.name} up to date!"
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy!
    flash[:notice] = "#{cat.name} was deleted. I hope you can live with yourself."
    redirect_to cats_url
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :description, :birth_date)
  end

  def validate_cat_owner
    cat = Cat.find(params[:id])
    redirect_to cats_url if cat.nil? || cat.user_id != current_user.id
  end
end
