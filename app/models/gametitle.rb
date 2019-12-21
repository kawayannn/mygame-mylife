class Gametitle < ApplicationRecord
  has_many :articles_gametitles, dependent: :destroy
  has_many :articles, through: :article_gametitles

  has_many :user_gametitles, dependent: :destroy
  has_many :user,through: :user_gametitles
end