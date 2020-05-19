class Super < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
