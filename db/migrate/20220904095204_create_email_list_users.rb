class CreateEmailListUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :email_list_users do |t|
      t.references :user
      t.references :email_list
      t.string :email

      t.timestamps
    end
  end
end
