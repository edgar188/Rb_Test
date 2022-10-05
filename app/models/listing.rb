class Listing < ApplicationRecord
  
  belongs_to :user
    
  # Removing accidental spaces from attributes
  auto_strip_attributes :url, squish: true

  validates :url, presence: true, length: { maximum: 1024 }
  
end