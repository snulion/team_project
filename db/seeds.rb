# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'likelion@email.com', password: '123456789', password_confirmation: '123456789')
User.create(email: 'test@email.com', password: '123456789', password_confirmation: '123456789')
User.create(email: 'test1@email.com', password: '123456789', password_confirmation: '123456789')
User.create(email: 'test2@email.com', password: '123456789', password_confirmation: '123456789')
Post.create(genre: 'jazz', content: 'whats song?', file_name: "", user_id: 1)
Post.create(genre: 'hiphop', content: 'humminghumming baby??', file_name: "", user_id: 1)
