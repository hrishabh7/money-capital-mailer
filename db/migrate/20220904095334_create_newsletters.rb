class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.string :description
      t.references :email_list
      t.datetime :published_at
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
