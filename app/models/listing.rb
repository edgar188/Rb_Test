class Listing < ApplicationRecord
  
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # Removing accidental spaces from attributes
  auto_strip_attributes :url, squish: true

  validates :url, presence: true, uniqueness: true, format: %r{\Ahttp(s)://.*?\.airbnb\.com/rooms}

  after_create :create_reviews

  private

  def create_reviews
    CreateListingReviewsJob.perform_later(self)
  end

end