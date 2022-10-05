class ReviewsController < ApplicationController
  
  before_action :set_listing, only: %i[collected_texts]
  
  def collected_texts
    reviews = @listing.reviews
    texts = reviews.pluck(:text)
    return render json: texts, status: :ok
  end

  private

  def set_listing
    @listing = current_user.listings.find(params[:listing_id])
  end
  
end
