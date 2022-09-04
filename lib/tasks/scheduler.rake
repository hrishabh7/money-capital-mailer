desc "This task will send daily recommendations blogs to users via email. And also this task is called by the heroku scheduler add-on"
task send_daily_recommendations: :environment do
  Newsletter.send_daily_recommendations
end
