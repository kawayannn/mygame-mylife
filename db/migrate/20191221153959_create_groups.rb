class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string      :title, null: false
      t.integer     :leader_id, null: false
      t.timestamps
    end
  end
end
