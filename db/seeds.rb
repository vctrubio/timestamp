require 'faker'

puts 'Creating 1 user and 1 admin: gg@gmail.com, password'

 user = User.new(
   name: Faker::Name.middle_name,
   username: Faker::Internet.username,
   email:    "mynew@gmail.com",
   password: "password"
 )

 user_admin = User.new(
  name: 'Admin',
  username: "timestamp.admin",
  email:    "gg@gmail.com",
  password: "password",
  admin: true
)

 user.save!
 user_admin.save!

puts 'Finished!'
