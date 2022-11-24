class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_offer, only: %i[new create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to offer_bookings_path(@booking) #my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @booking.destroy
  end

  # def my_bookings
  #   @my_offers = current_user.offers
  #   @my_bookings = @my_offers.bookings
  # end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
