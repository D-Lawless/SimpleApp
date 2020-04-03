# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


10.times do |n|

  username = Faker::Internet.user_name
  email = Faker::Internet.email
  password = "123123"
  User.create!(
      username: username,
      email: email,
      password: password,
      password_confirmation: password
  )
  puts "created user #{n + 1}"

end

users = User.all

i = 0
users.each do |user|
  i += 1
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  bio = Faker::Lorem.paragraph
  role = Faker::Company.profession

  user.build_profile(
      f_name: f_name,
      l_name: l_name,
      role: role,
      bio: bio
  )
  user.save!
  puts "Created Profile #{i}"

end

users = User.all

i = 0
users.each do |user|
  i += 1
  title = "Event Title #{i}"
  about = Faker::Lorem.paragraph + " ~ Event About #{i}"
  location = "Event Location #{i}"
  start_dt = Faker::Date.between(from: 20.days.ago, to: 19.days.ago)
  end_dt = Faker::Date.between(from: 2.days.ago, to: Date.today)

  user.events.build(
      title: title,
      about: about,
      location: location,
      start_dt: start_dt,
      end_dt: end_dt
  )

  user.save!
  puts "Created Event #{i}"

end

# users = User.all
#
# i = 0
# users.each do |user|
#   i += 1
#
#   title = "Post Title #{i}"
#   content = Faker::Lorem.paragraph + " ~ Post Content #{i}"
#   user_id = i
#   event_id = i
#
#   user.events.eventposts.build(
#       title: title,
#       content: content,
#       user_id: user_id,
#       event_id: event_id,
#   )
#
#   user.save!
#   puts "Created Event Post #{i}"
#
# end