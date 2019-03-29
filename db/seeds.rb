require 'faker'

puts 'Creating 10 users...'
10.times do
 user = User.new(
   name: 'John',
   username: Faker::Internet.username,
   email:    Faker::Internet.email,
   password: "password"
 )
 user.save!
end
puts 'Finished!'




