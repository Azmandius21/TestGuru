# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_names = %w(Anna Ivan Gleb Anton Kate Boris)
category_titles = %w(Backend Frontend Mobile\ Development)
test_titles = %w(Ruby HTML Ruby\ on\ Rails CSS Eclips)
answer_bodies = %w(1995 1993 2004 1996 2001)

users_array = user_names.length.times do |index|
                User.create!(name: user_names[index-1], email:'#{name[index-1]}@mail.ru')
              end
# User.create([{name: 'Anna', email: 'anna@mail.ru'},
#              {name: 'Ivan', email: 'ivan@mail.ru'},
#              {name: 'Gleb', email: 'gleb@mail.ru'}])

categories_array = Category.create!([{ title: 'Backend' },
                                    { title: 'Frontend' },
                                    { title: 'Mobile development' }])

tests_array = Test.create!([{ title: "Ruby", category_id: Category.find_by!(title: 'Backend').id, author_id: users_array[rand(5)].id },
                           { title: "HTML", category_id: Category.find_by!(title: 'Frontend').id, author_id: users_array[rand(5)].id },
                           { title: "Ruby on Rails", category_id: Category.find_by!(title: 'Backend').id, author_id: users_array[rand(5)].id },
                           { title: "CSS", category_id: Category.find_by!(title: 'Frontend').id, author_id: users_array[rand(5)].id },
                           { title: "Eclips", category_id: Category.find_by!(title: 'Mobile development').id, author_id: users_array[rand(5)].id  },
                           { title: "Ruby", level: 2, category_id: Category.find_by!(title: 'Backend').id, author_id: users_array[rand(5)].id }])

questions_array = 5.times do |index|
                    Question.create!(body: "When #{tests_titles[index-1]} was founded?", test_id: Test.find_by!(title: tests_titles[index-1]).id )
                  end
                                    # { body: "When HTML was founded?", test_id: 2 },
                                    # { body: "When Rails was founded?", test_id: 3 },
                                    # { body: "When CSS was founded?", test_id: 4 },
                                    # { body: "When Eclips was founded?", test_id: 5 },
                                    # { body: "Who is Yukihiro Matsumoto", test_id: 6 }])

answers_array = 5.times do |index|
                  Answer.create!( body:answer_bodies[index-1], correct: true, question_id: questions_array[index-1].id, author_id: users_array[rand(6)].id )
                end
                                # { body:"1993", correct: true, question_id: 2, author_id: 2 },
                                # { body:"2004", correct: true, question_id: 3, author_id: 2 },
                                # { body:"1996", correct: true, question_id: 4, author_id: 2 },
                                # { body:"1996", correct: true, question_id: 4, author_id: 1 },
                                # { body:"1996", correct: true, question_id: 4, author_id: 3 },
                                # { body:"2001", correct: true, question_id: 5, author_id: 2 },
                                # { body:"Author Ruby", correct: true, question_id: 6, author_id: 3 }])
