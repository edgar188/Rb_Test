class ListingsController < ApplicationController
  
  before_action :set_listing, only: %i[show destroy collected_reviews]
  
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
      redirect_to root_path, notice: t(:created)
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

  def collected_reviews
    @reviews = @listing.reviews.select('COUNT(*) AS count, date').group(:date).order(:date)
    first_date = @reviews.first.date
    current_date = Date.current
    all_months = []
    
    loop do
      first_date = first_date + 1.month
      break if first_date > current_date
      all_months << first_date
    end

    result = all_months.map do |month|
      month = {
        date: month.strftime("%B %Y"),
        count: @reviews.find_by_date(month)&.count || 0
      }
    end

    labels = result.pluck(:date)
    values = result.pluck(:count)
    render json: { labels: labels, values: values }, status: :ok
  end

  private

  def listing_params
    params.require(:listing).permit(:user_id, :url)
  end

  def set_listing
    @listing = current_user.listings.find(params[:id])
  end
  
end
