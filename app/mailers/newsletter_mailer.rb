class NewsletterMailer < ApplicationMailer
  def newsletter(newsletter, user)
    @newsletter = newsletter
    @user = user

    mail(to: @user.email, subject: @newsletter.subject)
  end
end
