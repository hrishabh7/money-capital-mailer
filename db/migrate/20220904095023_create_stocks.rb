class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
