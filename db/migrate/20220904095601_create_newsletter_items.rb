class CreateNewsletterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletter_items do |t|
      t.string :display
      t.references :newsletter
      t.references :target, polymorphic: true

      t.timestamps
    end
  end
end
