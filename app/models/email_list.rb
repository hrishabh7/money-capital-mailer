class EmailList < ApplicationRecord
  # Associations
  has_many :email_list_users, inverse_of: :email_list, dependent: :destroy
  has_many :users, through: :email_list_users
  has_many :newsletters

  def add_user(user)
    return if user.nil?

    member = email_list_users.where(user: user).first_or_initialize
    member.email = user.email
    member.save
  end

  def self.get_all_users
    where(name: 'All Users').first_or_create
  end

  def self.get_all_users_emails
    get_all_users.email_list_users.pluck(:name)
  end
end
