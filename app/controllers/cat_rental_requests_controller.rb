class CatRentalRequestsController < ApplicationController
  def new
    @rental = CatRentalRequest.new()
    @cat = Cat.find(params[:cat_id])

    render :new
  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    @cat = @rental.cat
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
end
