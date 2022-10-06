class CreateListingReviewsJob < ApplicationJob
  queue_as :create_listing_reviews
 
  def perform(listing)
    response = Scraping::Airbnb.call([listing.url])
    listing.reviews = response[:reviews]
  end
  
end