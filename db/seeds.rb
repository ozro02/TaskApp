# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true )
              
99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

puts "Users Created"

@users = User.order(:created_at).take(3)
50.times do |n|
  name =Faker::Lorem.sentence(2)
  description = Faker::Lorem.sentence(5)
  @users.each { |user| user.tasks.create!(name: name, description: description) }
end

puts "Tasks Created"