class CreateUserGametitles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_gametitles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gametitle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
