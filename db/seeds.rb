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

user_names = %w(Anna Ivan Gleb Anton Kate Boris)
category_titles = %w(backend frontend mobile_development)
test_titles = { backend: %w(Ruby Ruby\ on\ Rails),
                frontend: %w(HTML CSS),
                mobile_development: %w(Java Kotlin) }
question_bodies =%w(What\ is When\ was\ founded)

#create Users
user_names.map{|name| User.find_or_create_by!(name: name, email: "#{name}@mail.ru")}
users = User.all
#create Categories
category_titles.map{|title| Category.find_or_create_by!(title: title)}

#create Tests
Category.all.each do |category|
  2.times do |index|
    title = test_titles[category.title.to_sym].fetch(index -1)
    3.times{Test.create!(title: title, category_id: category.id, level: rand(1..3), author_id: users.first.id)}
  end
end

#create Questions
Test.all.each do |test|
  Question.create!(body: "#{question_bodies.sample} #{test.title} ", test_id: test.id )
end

#create Answers
Question.all.each_with_index do |question,index|
  Answer.create!( body:"answer #{index}", correct: true, question_id: question.id, author_id: users.sample.id )
end

puts "seeding done"
print "created: "
[User, Category, Test, Question, Answer].each {|klass| print "#{klass.count} #{klass.to_s} "}
puts "\n"
