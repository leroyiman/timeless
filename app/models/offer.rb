class Offer < ApplicationRecord

  belongs_to :user
  has_many :matches, dependent: :destroy
  has_many :timeslots, dependent: :destroy, autosave: true
  has_many :statuses, dependent: :destroy
  accepts_nested_attributes_for :timeslots

  after_create :find_matches

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def find_matches
    searches = Search.all
    # search = Search.find(params[:id])
    searches = searches.where(color: color) if color.present?
    searches = searches.where(size: size) if size.present?
    searches = searches.where(material: material) if material.present?
    searches = searches.where(condition: condition) if condition.present?


    return unless searches.present?

    searches.each do |search|
      Match.create(search_id: search.id, offer_id: id)
    end



    # matching_searches = searches.where(color: color)

    # return unless matching_searches.present?

    # matching_searches.each do |offer|
    #   Match.create(search_id: id, offer_id: offer.id)
    # end
  end

end
