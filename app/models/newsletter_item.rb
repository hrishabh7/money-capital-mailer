class NewsletterItem < ApplicationRecord
  # constants
  BLOG = 'blog'
  DISPLAY_TYPES = [
    BLOG
    # add more newsletter items. eg: banner, header etc
  ]

  # associations
  belongs_to :newsletter
  belongs_to :target, polymorphic: true, inverse_of: :newsletter_items, optional: true

  # validations
  validates :display, presence: true, inclusion: { in: DISPLAY_TYPES, message: '%<value>s is not a valid display type' }
end
