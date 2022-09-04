class EmailListUser < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :email_list
end
