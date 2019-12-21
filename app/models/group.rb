class Group < ApplicationRecord
  has_many :users
  has_many :messages

  has_many :group_gametitles, dependent: :destroy
  has_many :gametitles, through: :group_gametitles
end
