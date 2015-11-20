# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


password = 'teacher123'

User.create(
    first_name: 'Marcin',
    last_name: 'Drozd',
    username: 'marcin',
    password: password,
    password_confirmation: password,
    email: 'marcin@example.com',
    role: 'admin'
  )

User.create(
    first_name: 'Ania',
    last_name: 'Drozd',
    username: 'ania',
    password: password,
    password_confirmation: password,
    email: 'ania@example.com',
    role: 'admin'
  )