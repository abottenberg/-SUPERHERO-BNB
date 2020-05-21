class Super < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
#   validates :location, :photo, presence: true
end
