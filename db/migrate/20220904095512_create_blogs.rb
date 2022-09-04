class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.datetime :published_at
      t.references :stock

      t.timestamps
    end
  end
end
