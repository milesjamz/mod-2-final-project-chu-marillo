# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Item.delete_all

cars = Category.create(name:'Cars')
guitars = Category.create(name:'Guitars')
headphones = Category.create(name:'Headphones')
sports = Category.create(name:'Sporting Equipment')

Item.create(name: "Ferrari 488", price: 250_000, category_id: 9)
Item.create(name:"Fiat 500", price: 17_500, category_id: 9)
Item.create(name:"Pontiac Aztek", price: 500, category_id: 9)

Item.create(name:"Martin D-28", price: 2_700, category_id: 10)
Item.create(name:"Fender Strat", price: 750, category_id: 10)
Item.create(name:"Gibson Les Paul", price: 1_100, category_id: 10)

Item.create(name:"Bose QuietComfort", price: 350, category_id: 11)
Item.create(name:"Apple AirPods", price: 170, category_id: 11)
Item.create(name:"Sennheiser HD820", price: 2_400, category_id: 11)

Item.create(name:"Baseball", price: 45, category_id: 12)
Item.create(name:"Basketball", price: 75, category_id: 12)
Item.create(name:"Football", price: 20, category_id: 12)


