class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :article_gametitles, dependent: :destroy
  has_many :gametitles, through: :article_gametitles
end
