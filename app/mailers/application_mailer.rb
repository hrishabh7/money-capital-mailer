class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SENDER_EMAIL')
  layout 'mailer'
end
