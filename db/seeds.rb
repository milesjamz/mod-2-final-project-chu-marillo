# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.delete_all
Item.delete_all
Cart.delete_all



cars = Category.create(name:'cars')
guitars = Category.create(name:'guitars')
cigars = Category.create(name:'cigars')
headphones = Category.create(name:'headphones')

ferrari = Item.create(name: "Ferrari Testarossa", price: 200_000, category_id: 1)
ford = Item.create(name:"Ford Fusion", price: 20_000, category_id: 1)
martin = Item.create(name:"Martin", price: 5_000, category_id: 2)
cohiba = Item.create(name:"Cohiba", price: 150, category_id: 3)
sennheiser = Item.create(name:"Sennheiser", price: 200, category_id: 4)

cart1 = Cart.create(status: true, user_id: 6, total_price: 0)
cart2 = Cart.create(status: false, user_id: 6, total_price: 0)