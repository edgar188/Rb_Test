class Review < ApplicationRecord
  
  belongs_to :listing
  
  # Removing accidental spaces from attributes
  auto_strip_attributes :reviewer_name, :text, squish: true

  validates :reviewer_name, presence: true, length: { maximum: 255 }
  validates :text, presence: true
  validates_presence_of :external_id, :date

end