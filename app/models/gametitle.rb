class Gametitle < ApplicationRecord
  has_many :articles_gametitles, dependent: :destroy
  has_many :articles, through: :article_gametitles
end
