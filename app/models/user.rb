class User < ApplicationRecord
  
  has_many :listings, dependent: :destroy
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # Removing accidental spaces from attributes
  auto_strip_attributes :first_name, :last_name, :email, squish: true

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { maximum: 255 }
  
end
