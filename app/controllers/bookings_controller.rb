class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]
  # voir pour la show : nécessaire si on veut annuler ?

  def new
    @booking = Booking.new
    # authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    # @booking.user = current_user
    # authorize @booking
    if @booking.save
      redirect_to my_bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # authorize @offer

  end

  def update
    # authorize @offer
    if @booking.update(params_booking)
      redirect_to my_bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @offer
    @booking.destroy
  end

  def my_bookings
    @my_offers = current_user.offers
    authorize @my_offers
  end

private

def set_booking
  @booking = Booking.find(params[:id])
end
end
