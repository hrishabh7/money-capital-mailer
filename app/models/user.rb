class User < ApplicationRecord
  after_create :add_user_to_email_list

  private

  def add_user_to_email_list
    EmailList.get_all_users.add_user(self)
  end
end
