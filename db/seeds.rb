# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding..."

User.destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
TestsUser.destroy_all

user_names = %w(Anna Ivan Gleb Anton Kate Boris)
category_titles = %w(backend frontend mobile\ development)
test_titles =  [%w(Ruby Ruby\ on\ Rails Python),
                %w(HTML CSS JavaScript),
                %w(Java Kotlin C++)]
question_bodies =%w(What\ is When\ was\ founded)

#create Users
users_array = []
user_names.map{|name| users_array << User.find_or_create_by!(name: name, email: "#{name}@mail.ru")}

#create Categories
categories_array = []
category_titles.each do |title|
   categories_array << Category.create!(title: title)
end

#create Tests
tests_array = []
tests_array << users_array[0].created_tests.create!(
  [{title: test_titles[0][0], level: 1, category: categories_array[0]},
   {title: test_titles[0][1], level: 1, category: categories_array[0]},
   {title: test_titles[0][2], level: 1, category: categories_array[0]},
   {title: test_titles[1][0], level: 1, category: categories_array[1]},
   {title: test_titles[1][1], level: 1, category: categories_array[1]},
   {title: test_titles[1][2], level: 1, category: categories_array[1]},
   {title: test_titles[2][0], level: 1, category: categories_array[2]},
   {title: test_titles[2][1], level: 1, category: categories_array[2]},
   {title: test_titles[2][2], level: 1, category: categories_array[2]}])
tests_array = tests_array.flatten

#create Questions
questions_array = []
tests_array.each do |test|
  questions_array << test.questions.create!(body: "#{question_bodies.sample} #{test.title} ")
end

#create Answers
answers_array = []
questions_array.each do |question|
  answers_array << question.answers.create!(
    [{body:"answer 1", correct: false},
     {body:"answer 2", correct: true},
     {body:"answer 3", correct: false},
     {body:"answer 4", correct: true}])
end
answers_array = answers_array.flatten

#create TestsUser
TestsUser.create!([{user: users_array[3], test: tests_array[0]},
                   {user: users_array[3], test: tests_array[1]},
                   {user: users_array[1], test: tests_array[0]},
                   {user: users_array[1], test: tests_array[1]}])



#INFO
puts "seeding done"
print "created: "
[User, Category, Test, Question, Answer, TestsUser]
  .each { |klass| print "#{klass.count} #{klass.to_s} " }
puts "\n"
