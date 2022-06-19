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
test_titles =  [%w(Ruby Ruby\ on\ Rails Python), %w(HTML CSS JavaScript), %w(Java Kotlin C++)]
question_bodies =%w(What\ is When\ was\ founded)

#create Users
user_names.map{|name| User.find_or_create_by!(name: name, email: "#{name}@mail.ru")}

users = User.all


#create Categories
3.times do |index|
   Category.create!(title: category_titles[index-1])
end

categories = Category.all

#create Tests
5.times do
  3.times do |index|
    users[0].created_tests.create!(title: test_titles.fetch(index-1).sample, category: categories[index-1], level: rand(1..10))
  end
end

tests = Test.all

#create Questions
tests.each do |test|
  test.questions.create!(body: "#{question_bodies.sample} #{test.title} ")
end


#create Answers
Question.all.each_with_index do |question,index|
  3.times {question.answers.create!(body:"answer #{index}", correct: true)}
end

#create TestsUser
tests.length.times do |index|
  TestsUser.create!(user: users[3], test: tests[index])
end


#INFO
puts "seeding done"
print "created: "
[User, Category, Test, Question, Answer].each {|klass| print "#{klass.count} #{klass.to_s} "}
puts "\n"
