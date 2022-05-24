# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pabu = User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty")
loki = User.create!(name: "Loki", email: "loki@email.com", password: "qwerty", password_confirmation: "qwerty")
thor = User.create!(name: "Thor", email: "thor@email.com", password: "qwerty", password_confirmation: "qwerty")
ian = User.create!(name: "Ian", email: "ian@email.com", password: "qwerty", password_confirmation: "qwerty")
phillip = User.create!(name: "Phillip", email: "phillip@email.com", password: "qwerty", password_confirmation: "qwerty")
