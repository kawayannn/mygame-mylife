class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true
  validates :content, length: {maximum: 500}
end
