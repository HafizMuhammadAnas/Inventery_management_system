# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  role_user = Role.create(:name => 'user')
  role_admin = Role.create(:name => 'admin')
  User.create(:email => 'user@example.com' ,  :password => 'user123', :role => 'admin', :name => 'Hafiz Anas')
  User.create(:email => 'admin@example.com' , :password => 'admin123', :role=> 'admin', :name => 'Hafiz Anas')

  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts '++++++++++++++++++++++++++++'
# require 'faker'

# 30.times do |i|
#   p = Product.new(
#     name: Faker::Name.name,
#     slug: Faker::Internet.slug,
#     price: Faker::Commerce.price,
#     description: Faker::Lorem.sentence
#   )
#   p.status = 0
#   p.stock = 0
#   p.sku = "Skr#{i+1}"
#   p.save!
# end
