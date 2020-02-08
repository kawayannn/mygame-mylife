class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :text, presence: true
  validates :text, length: {maximum: 252}
end
