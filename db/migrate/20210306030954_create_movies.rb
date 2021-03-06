class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :list_id
      t.text :title
      t.text :impression

      t.timestamps
    end
  end
end
