# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(first_name: 'Asad', last_name: 'Ali', password: 'password', email: 'asad@example.com')

projects = (1..5).map do
            Project.create(title: Faker::Movie.quote)
          end

tasks = projects.map do |project|
  Task.create project: project, title: Faker::GameOfThrones.character, description: Faker::GameOfThrones.quote
  Task.create project: project, title: Faker::GameOfThrones.character, description: Faker::GameOfThrones.quote
end

tasks.each do |task|
  task.comments.create(body: Faker::GameOfThrones.quote, user: user)
end