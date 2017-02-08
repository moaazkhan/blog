# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! name: 'Test User 1', email: '1@test.com', password: '12345678', username: 'test 1'
User.create! name: 'Test User 2', email: '2@test.com', password: '12345678', username: 'test2'
User.create! name: 'Test User 3', email: '3@test.com', password: '12345678', username: 'test3'
User.create! name: 'Test User 4', email: '4@test.com', password: '12345678', username: 'test4'

@user = User.first

@article = Article.create! user: @user, title: 'Test Article', content: 'Hello'

3.times do |i|
  Comment.create! user: @user, article: @article, content: "Test Comment #{i}"
end
