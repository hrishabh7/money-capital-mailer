class Blog < ApplicationRecord
  # associations
  belongs_to :stock
  has_many :newsletter_items, foreign_key: 'target_id'
  has_many :newsletters, through: :newsletter_items

  def publish!
    self.published_at = DateTime.now
    save
  end
end
