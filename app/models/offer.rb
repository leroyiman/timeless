class Offer < ApplicationRecord
  geocoded_by :location
  belongs_to :user
  has_many_attached :photos
  has_many :matches, dependent: :destroy
  has_many :hides, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :timeslots, dependent: :destroy, autosave: true
  has_many :favorites, dependent: :destroy
  validates :title, presence: true, length: { maximum: 10 }
  validates :price, presence: false, numericality: { only_integer: true }, presence: {message: "must be a number"}
  validates :location, presence: true, length: { maximum: 500 }
  validates :photos, presence: true, length: { maximum: 3 }
  has_many :statuses, dependent: :destroy
  accepts_nested_attributes_for :timeslots
  after_validation :geocode, if: :will_save_change_to_location?
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
