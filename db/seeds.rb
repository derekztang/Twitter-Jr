require 'faker'

5.times do
  user = User.create(username: Faker::Name.name, password: "test")
  5.times {user.tweets.create(content: Faker::Lorem.sentence)}
end
