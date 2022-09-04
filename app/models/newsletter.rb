class Newsletter < ApplicationRecord
  # association
  belongs_to :email_list
  has_many :newsletter_items
  has_many :blogs, through: :newsletter_items

  # scopes
  scope :today_recommendations, -> { where(published_at: DateTime.now.beginning_of_day) }

  def publish!
    self.published_at = Date.today
    save
  end

  def published?
    published_at.present?
  end

  def delivered?
    delivered_at.present?
  end

  def self.send_daily_recommendations
    today_recommendations.includes(newsletter_items: [target: :stock]).each do |newsletter|
      newsletter.deliver!
    end
  end

  def deliver!
    return unless published? # && !delivered?

    email_list.users.find_each do |user|
      NewsletterMailer.newsletter(self, user).deliver_now
    end

    self.delivered_at = DateTime.now
    save
  rescue StandardError => e
    puts "Newsletter#deliver!: Error while delivering newsletter: #{subject}, message: #{e.message}, backtrace: #{e.backtrace}"
  end
end
