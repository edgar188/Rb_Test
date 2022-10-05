class Listing < ApplicationRecord
  
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # Removing accidental spaces from attributes
  auto_strip_attributes :url, squish: true

  validates :url, presence: true, length: { maximum: 1024 }, format: %r{\Ahttp(s)://.*?\.airbnb\.com/}

end