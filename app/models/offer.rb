class Offer < ApplicationRecord

  belongs_to :user
  has_many :matches, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  has_many :statuses, dependent: :destroy

end
