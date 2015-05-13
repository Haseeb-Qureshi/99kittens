class CatRentalRequestsController < ApplicationController
  before_action :validate_owner, only: [:approve, :deny]

  def new
    @rental = CatRentalRequest.new()
    @cat = Cat.find(params[:cat_id])

    render :new
  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    @cat = @rental.cat
    @rental.user_id = current_user.id
    if @rental.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @rental.errors.full_messages
      render :new
    end
  end

  def approve
    @rental = CatRentalRequest.find(params[:id])
    @rental.approve!

    redirect_to cat_url(@rental.cat)
  end


  def deny
    @rental = CatRentalRequest.find(params[:id])
    @rental.deny!

    redirect_to cat_url(@rental.cat)
  end

  private

  def rental_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end

  def validate_owner
    cat = CatRentalRequest.find(params[:id]).cat
    redirect_to cats_url if cat.nil? || cat.owner != current_user
  end
end
