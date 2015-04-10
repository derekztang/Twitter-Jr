require 'faker'
test = User.create(username: "testtest", password: "test", user_bio: "hope this works!", user_bio_picture: "#")

5.times do
  User.create(username: Faker::Name.first_name, password: "test", user_bio: Faker::Company.bs, user_bio_picture: "#")
end

User.all.each do |user|
  user.tweets << Tweet.create(content: Faker::Lorem.sentence)
end

