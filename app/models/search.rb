class Search < ApplicationRecord
  belongs_to :user
  has_many :matches

  after_create :find_matches

  def find_matches
    offers = Offer.all
    # search = Search.find(params[:id])
    offers = offers.where(color: color)
    offers = offers.where(category: category)
    offers = offers.where(color: color) if category.present?
    offers = offers.where(size: size) if category.present?
    offers = offers.where(material: material) if category.present?
    offers = offers.where(condition: condition) if category.present?

    return unless offers.present?

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
