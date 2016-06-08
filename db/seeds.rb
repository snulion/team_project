# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'likelion@email.com', password: '123456789', password_confirmation: '123456789')
Post.create(genre: 'Jazz', content: '딴딴딴 딴딴딴 이 노래 제목은 뭔가요', file_name: "", user_id: 1)
Post.create(genre: 'HipHop', content: '딴딴딴 붐붐 뿜~ 이 노래 제목 뭐냐??', file_name: "", user_id: 1)
