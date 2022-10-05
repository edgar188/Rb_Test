class ListingsController < ApplicationController
  
  before_action :set_listing, only: %i[show destroy]
  
  def index
    @listings = current_user.listings
  end

  def show; end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: t(:created)
    else
      flash[:msg] = { message: @listing.errors.full_messages }
      render :new, status: :bad_request
    end
  end

  def destroy
    unless @listing.destroy
      return redirect_to @listing, alert: t(:not_destroyed)
    end

    redirect_to root_path, notice: t(:destroyed)
  end

  private

  def listing_params
    params.require(:listing).permit(:user_id, :url)
  end

  def set_listing
    @listing = current_user.listings.find(params[:id])
  end
  
end
