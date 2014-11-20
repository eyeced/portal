# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  username = "fakeuser#{n + 1}"
  password = "password"
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude
  address = Faker::Address.street_address
  User.create!(name: name,
               email: email,
               username: username,
               password: password,
               password_confirmation: password,
               approved: true,
               role: "executive",
               address: address,
               longitude: longitude,
               latitude: latitude)
end

30.times do |n|
  name = Faker::Lorem.word
  comment = Faker::Lorem.sentence
  t = Task.create!(
    name: name,
    comment: comment,
    status: "started")
  5.times do |x|
    TaskComment.create!(
      comment: Faker::Lorem.sentence,
      task_id: t.id
    )
  end
end
30.times do |n|
  name = Faker::Lorem.word
  comment = Faker::Lorem.sentence
  t = Task.create!(
    name: name,
    comment: comment,
    status: "completed")
  5.times do |x|
    TaskComment.create!(
      comment: Faker::Lorem.sentence,
      task_id: t.id
    )
  end
end
30.times do |n|
  name = Faker::Lorem.word
  comment = Faker::Lorem.sentence
  t = Task.create!(
    name: name,
    comment: comment,
    status: "incompleted")
  5.times do |x|
    TaskComment.create!(
      comment: Faker::Lorem.sentence,
      task_id: t.id
    )
  end
end
