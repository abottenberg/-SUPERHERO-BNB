class Super < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  acts_as_votable
  validates :quote, presence: true
#   validates :location, :photo, presence: true
end
