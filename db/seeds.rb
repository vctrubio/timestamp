

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


puts 'victor sucks, I am creating 10 events'

10.times do 

event = Event.new(
    title: 'a event',
    description: Faker::Lorem.sentences,
    start_time: Date.new,
    user_id: (1..10).to_a.sample
)
event.save
end