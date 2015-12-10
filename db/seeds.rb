# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Users
users = User.all
10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
    user.save!
end

# Create Wikis
50.times do
    post = Post.create!(
      user:   users.sample,
      topic:  topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
    )

# Create an admin user
admin = User.create(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role: 'admin'
  )
  admin.save!


  member = User.create(
    name: 'Member',
    email: 'member@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    role: 'member'
    )
    admin.save!cd

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
