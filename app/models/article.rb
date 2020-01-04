class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :article_gametitles
  has_many :gametitles, through: :article_gametitles
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
