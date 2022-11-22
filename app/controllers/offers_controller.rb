class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_offer, only: %i[show edit update destroy]

  def index
    @offers = Offer.all
    @restaurants = policy_scope(Offer)
  end

  def show
    authorize @offer
  end

  def new
    @offer = Offer.new
    autorize @offer
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user = current_user
    autorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit update destroy
  # My offers

  def my_offers
    @offers = current_user.offers
  end

  def edit
    authorize @offer
  end

  def update
    authorize @offer # Add this line
    if @offer.save
      @offer.update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    authorize @offer # Add this line
  end

  private

  def params_offer
    params.require(:offer).permit(:title, :description, :location, :start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
