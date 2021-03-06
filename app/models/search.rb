class Search < ApplicationRecord
  belongs_to :user
  has_many :matches , dependent: :destroy

  after_create :find_matches

  def find_matches
    offers = Offer.all
    # search = Search.find(params[:id])
    offers = offers.where(category: category) if category.present?
    offers = offers.where(color: color) if color.present?
    offers = offers.where(size: size) if size.present?
    offers = offers.where(material: material) if material.present?
    offers = offers.where(condition: condition) if condition.present?

    return unless offers.present? #if not

    offers.each do |offer|
      Match.create(search_id: id, offer_id: offer.id)
    end

    # matching_offers = offers.where(color: color)

    # return unless matching_offers.present?

    # matching_offers.each do |offer|
    #   Match.create(search_id: id, offer_id: offer.id)
    # end

  end

end
