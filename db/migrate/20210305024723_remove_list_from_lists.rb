class RemoveListFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :list, :text
  end
end
