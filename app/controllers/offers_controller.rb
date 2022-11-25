class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_offer, only: %i[show edit update destroy]

  def index
    @offers = Offer.all
    @offers = policy_scope(Offer)
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
  end

  def show
    authorize @offer
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
      flash[:notice] = "Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit update destroy
  # My offers

  def edit
    authorize @offer
  end

  def update
    authorize @offer # Add this line
    if @offer.update(params_offer)
      redirect_to my_offers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @offer # Add this line
    @offer.destroy
  end

  def my_offers
    @my_offers = current_user.offers
    authorize @my_offers
  end

  private

  def params_offer
    params.require(:offer).permit(:title, :description, :location, :picture, :start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
