# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Corporation.create(name: 'Google')
Corporation.create(name: 'Facebook')
Corporation.create(name: 'Apple')

# 会社に雇われているUser
25.times do
  User.create(name: Faker::Name.name,
              age: Faker::Number.between(0, 80),
              sex_id: Faker::Number.between(1, 3),
              corporation_id: Faker::Number.between(1, 3))
end

# 会社に雇われていないUser
25.times do
  User.create(name: Faker::Name.name,
              age: Faker::Number.between(0, 80),
              sex_id: Faker::Number.between(1, 3))
end

# 今いるユーザーに対して適当にDogモデルを付与する
user_cnt = User.count
100.times do
  Dog.create(user_id: Faker::Number.between(1, user_cnt))
end
