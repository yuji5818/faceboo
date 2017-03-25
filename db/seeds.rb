# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do |n|
  email = Faker::Internet.email
  password = "password"
  user = User.create!(email: email,
               password: password,
               password_confirmation: password,
               uid: "11111#{n}",
               provider: "",
               )
   5.times do |n|
     Topic.create!(
                      image: (open("#{Rails.root}/app/assets/images/mentor.jpg")),
                      content: "いいな〜×２、diveintocodeっていいな",
                      user_id: user.id,
                      )
   end
end

# User.all.each do |user|
#   5.times do |n|
#     Topic.create!(
#                      image: Faker::Avatar.image,
#                      content: "いいな〜×２、diveintocodeっていいな",
#                      user_id: user.id,
#                      )
#   end
# end
# 5.times do |n|
#   Topic.create!(
#                    image: Faker::Avatar.image,
#                    content: "いいな〜×２、diveintocodeっていいな",
#                    user_id: User.first.id,
#                    )
# end
