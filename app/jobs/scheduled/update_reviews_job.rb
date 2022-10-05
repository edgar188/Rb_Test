class Scheduled::UpdateReviewsJob < ApplicationJob
  queue_as :update_reviews
 
  def perform
    listings = Listing.all

    listings.each do |listing|
      response = Scraping::Airbnb.call([listing.url])
      listing.reviews << response[:reviews]
    end
  end
  
end