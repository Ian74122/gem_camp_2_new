# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = %w(admin@rails.school admin_2@rails.school admin_3@rails.school)
users.each do |email|
  user = User.find_or_initialize_by(email: email)
  user.password = 'qwer4321'
  user.password_confirmation = "qwer4321"
  user.save
end

30.times do |i|
  puts "start create #{i} post"
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample)
  (1..20).to_a.sample.times do
    Comment.create(content: Faker::Lorem.sentence, user: User.all.sample, post: post)
  end
  puts "finish #{i} post"
end