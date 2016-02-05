class CatRentalRequestsController < ApplicationController
  before_action :validate_request_owner, only: [:approve, :deny]

  def new
    @rental = CatRentalRequest.new
    @cat = Cat.find(params[:cat_id])

    render :new
  end

  def create
    @rental = current_user.cat_rental_requests.new(rental_params)
    @cat = @rental.cat
    if @rental.save
      flash[:notice] = "Request submitted."
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @rental.errors.full_messages
      render :new
    end
  end

  def approve
    make_decision!(:approve!)
  end

  def deny
    make_decision!(:deny!)
  end

  private

  def make_decision!(approve_or_deny)
    @rental = CatRentalRequest.find(params[:id])
    @rental.call(approve_or_deny)

    outcome = approve_or_deny == :approve! ? "approved" : "denied"
    flash[:notice] = "Request was #{outcome}."

    redirect_to cat_url(@rental.cat)
  end

  def rental_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end

  def validate_request_owner
    cat = CatRentalRequest.find(params[:id]).cat
    redirect_to cats_url if cat.nil? || cat.user_id != current_user.id
  end
end
