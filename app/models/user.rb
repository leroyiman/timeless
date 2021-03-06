class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :favorites, dependent: :destroy
  has_many :hides, dependent: :destroy
  has_many :matches
  has_many :searches, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  validates :username, uniqueness: true
end
