class AddMemoToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :memo, :text
  end
end
