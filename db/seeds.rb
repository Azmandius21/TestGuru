# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{name: 'Anna', email: 'anna@mail.ru'},
             {name: 'Ivan', email: 'ivan@mail.ru'},
             {name: 'Gleb', email: 'gleb@mail.ru'}])

Category.create([{ title: 'Backend' },
                 { title: 'Frontend' },
                 { title: 'Mobile development' }])

Test.create([{ title: "Ruby", category_id: 1, author_id: 1 },
             { title: "HTML", category_id: 2, author_id: 1 },
             { title: "Ruby on Rails", category_id: 1, author_id: 1 },
             { title: "CSS", category_id: 2, author_id: 1 },
             { title: "Eclips", category_id: 3, author_id: 1 },
             { title: "Ruby", level: 2, category_id: 1, author_id: 1 }])

Question.create([{ body: "When Ruby was founded?", test_id: 1 },
                 { body: "When HTML was founded?", test_id: 2 },
                 { body: "When Rails was founded?", test_id: 3 },
                 { body: "When CSS was founded?", test_id: 4 },
                 { body: "When Eclips was founded?", test_id: 5 },
                 { body: "Who is Yukihiro Matsumoto", test_id: 6 }])

Answer.create([{ body:"1995", correct: true, question_id: 1, author_id: 2 },
               { body:"1993", correct: true, question_id: 2, author_id: 2 },
               { body:"2004", correct: true, question_id: 3, author_id: 2 },
               { body:"1996", correct: true, question_id: 4, author_id: 2 },
               { body:"1996", correct: true, question_id: 4, author_id: 1 },
               { body:"1996", correct: true, question_id: 4, author_id: 3 },
               { body:"2001", correct: true, question_id: 5, author_id: 2 },
               { body:"Author Ruby", correct: true, question_id: 6, author_id: 3 }])
