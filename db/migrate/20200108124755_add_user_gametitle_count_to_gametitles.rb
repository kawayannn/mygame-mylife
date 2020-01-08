class AddUserGametitleCountToGametitles < ActiveRecord::Migration[5.2]
  def self.up
    add_column :gametitles, :user_gametitle_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :gametitles, :user_gametitle_count
  end
end
