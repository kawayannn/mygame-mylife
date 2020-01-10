class Group < ApplicationRecord
  has_many :messages

  has_many :group_gametitles, dependent: :destroy
  has_many :gametitles, through: :group_gametitles

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  mount_uploader :image, GroupImageUploader

  def join?(user_id)
    self.user_ids.include?(user_id)
  end
  
end
