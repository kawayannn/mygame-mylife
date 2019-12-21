class CreateGroupGametitles < ActiveRecord::Migration[5.2]
  def change
    create_table :group_gametitles do |t|
      t.references :group, null: false, foreign_key: true
      t.references :gametitle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
