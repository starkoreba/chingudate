class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_list, only: %i[show create]

  def index
    @offers = Offer.all
  end

  def show; end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_offer)
    if @create.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_offer
    params.require(:offer).permit(:title, :description, :location, :start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end