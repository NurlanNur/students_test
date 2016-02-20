# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'admin', email: 'admin@example.com', password: '12345678',
                           password_confirmation: '12345678')
users = []

3.times do
  name = Faker::Name.name
  users.push User.create(name: name, email: Faker::Internet.email(name),
                         password: '12345678',
                         password_confirmation: '12345678')
end

tests = []

10.times do
  tests << Test.create(name: Faker::Lorem.sentence, description: Faker::Lorem.sentence)
end

questions = []

10.times do
  questions << Question.create(question: Faker::Lorem.sentence, test: tests.sample)
end
answers = []
is_correct =[true, false]
10.times do
  answers << Answer.create(answer: Faker::Lorem.word, is_correct: is_correct.sample, question: questions.sample)
end