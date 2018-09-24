class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :micropost_favorites, class_name: 'favorites', foreign_key: 'micropost_id', dependent: :destroy
  has_many :fans, through: :micropost_favorites, source: :user
end