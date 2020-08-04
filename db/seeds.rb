# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Day.destroy_all
Trip.destroy_all 

greece = Trip.create(name: "Honeymoon to Greece", start_date: "2021-05-15", end_date: "2021-05-28")
yellowstone = Trip.create(name: "Trip to Yellowstone", start_date: "2021-09-10", end_date: "2021-09-13")

Day.create(number: 1, date: "2021-05-15", start_city: "Denver, Colorado", end_city: "Athens, Greece", trip: greece)
Day.create(number: 2, date: "2021-05-16", start_city: "Athens, Greece", end_city: "Athens, Greece", trip: greece)
Day.create(number: 3, date: "2021-05-17", start_city: "Athens, Greece", end_city: "Oia, Greece", trip: greece)
Day.create(number: 4, date: "2021-05-18", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece)
Day.create(number: 5, date: "2021-05-19", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece)
Day.create(number: 6, date: "2021-05-20", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece)
Day.create(number: 7, date: "2021-05-21", start_city: "Oia, Greece", end_city: "Paros, Greece", trip: greece)
Day.create(number: 8, date: "2021-05-22", start_city: "Paros, Greece", end_city: "Paros, Greece", trip: greece)
Day.create(number: 9, date: "2021-05-23", start_city: "Paros, Greece", end_city: "Paros, Greece", trip: greece)
Day.create(number: 10, date: "2021-05-24", start_city: "Paros, Greece", end_city: "Naxos, Greece", trip: greece)
Day.create(number: 11, date: "2021-05-25", start_city: "Naxos, Greece", end_city: "Naxos, Greece", trip: greece)
Day.create(number: 12, date: "2021-05-26", start_city: "Naxos, Greece", end_city: "Naxos, Greece", trip: greece)
Day.create(number: 13, date: "2021-05-27", start_city: "Naxos, Greece", end_city: "Athens, Greece", trip: greece)
Day.create(number: 14, date: "2021-05-28", start_city: "Athens, Greece", end_city: "Denver, Colorado", trip: greece)

Day.create(number: 1, date: "2021-09-10", start_city: "Denver, Colorado", end_city: "Jackson, Wyoming", trip: yellowstone)
Day.create(number: 2, date: "2021-09-11", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone)
Day.create(number: 3, date: "2021-09-12", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone)
Day.create(number: 4, date: "2021-09-13", start_city: "Jackson, Wyoming", end_city: "Denver, Colorado", trip: yellowstone)