class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :list_title
      t.text :list
      t.float :rate

      t.timestamps
    end
  end
end
