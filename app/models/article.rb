class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :article_gametitles,dependent: :destroy
  has_many :gametitles, through: :article_gametitles
  
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, :content, presence: true
  validates :title, length: {maximum: 40}
  validates :content, length: {maximum: 1000}

  mount_uploader :image, ArticleThumbnailsUploader
  is_impressionable counter_cache: true
  
end
