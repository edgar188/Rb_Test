class Listing < ApplicationRecord
  
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # Removing accidental spaces from attributes
  auto_strip_attributes :url, squish: true

  validates :url, presence: true, length: { maximum: 1024 }, format: %r{\Ahttp(s)://.*?\.airbnb\.com/rooms}

  after_commit :create_reviews, on: :create

  private

  def create_reviews
    response = Scraping::Airbnb.call([self.url])
    self.reviews = response[:reviews]
  end

end