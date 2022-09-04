# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Users'
5.times { User.create(name: Faker::Name.name, email: Faker::Internet.email) }
puts 'Users seeded'

puts 'Seeding Stocks'
5.times { Stock.create(name: Faker::Company.name, price: Faker::Commerce.price) }
puts 'Stocks seeded'

puts 'Seeding Newsletter'
subject = 'Team MoneyCapital'
description = 'Market is about to open. Checkout the best trading recommendations ideas for today\'s market.'
newsletter = Newsletter.create(email_list: EmailList.first, subject: subject, description: description)
puts 'Newsletter seeded'

puts 'Creating blogs'
10.times { Blog.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs.reduce(''){|acc, para| acc + para }, stock_id: rand(1..5)) }
puts 'Blogs created'

puts 'Publishing blogs'
Blog.all.each { |blog| blog.publish! }
puts 'Blogs published'

puts 'Creating newsletter items'
Blog.all.each { |blog| NewsletterItem.create(newsletter: newsletter, target: blog, display: NewsletterItem::BLOG) }
puts 'Created newsletter blogs'

puts 'Publishing Newsletter'
newsletter.publish!
puts 'Newsletter published'
