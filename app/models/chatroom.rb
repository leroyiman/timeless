class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :offer

  def offering_user
    offer.user
  end

  validates_uniqueness_of :user_id, scope: :offer_id
  # belongs_to :requesting_user
  # belongs_to :offering_user
end
