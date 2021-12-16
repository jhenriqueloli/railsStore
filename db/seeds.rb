# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Administrator', email: "admin@example.com", password: "654321", admin: true) 
User.create(username: 'Joao Henrique', email: "joao@henrique.com", password: "123456", admin: false)

Vape.create(name: "Vape A", brand: "Brand A", warrancy: "12", price: "99.99", quantity: "10", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape B", brand: "Brand B", warrancy: "12", price: "88.88", quantity: "15", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape C", brand: "Brand C", warrancy: "12", price: "77.77", quantity: "20", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape D", brand: "Brand D", warrancy: "12", price: "66.66", quantity: "25", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape E", brand: "Brand E", warrancy: "12", price: "55.55", quantity: "30", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape F", brand: "Brand F", warrancy: "12", price: "44.44", quantity: "35", code: Time.now.to_i )
sleep 1.0
Vape.create(name: "Vape G", brand: "Brand G", warrancy: "12", price: "33.33", quantity: "40", code: Time.now.to_i )
sleep 1.0
Essence.create(name: "Essence X", brand: "Brand X", flavor: "cherry", size: "30", strength:"soft", price: "9.99", quantity: "10", code: Time.now.to_i )
sleep 1.0
Essence.create(name: "Essence Y", brand: "Brand Y", flavor: "choccolate", size: "30", strength:"medium", price: "8.88", quantity: "15", code: Time.now.to_i )
sleep 1.0
Essence.create(name: "Essence Z", brand: "Brand Z", flavor: "grappe", size: "30", strength:"hard", price: "7.77", quantity: "20", code: Time.now.to_i )
sleep 1.0
Accessory.create(name: "Accessory 9", brand: "Brand 9", price: "49.99", quantity: "10", vape_id: "1", code: Time.now.to_i )
sleep 1.0
Accessory.create(name: "Accessory 8", brand: "Brand 8", price: "48.88", quantity: "10", vape_id: "1", code: Time.now.to_i )
sleep 1.0
Accessory.create(name: "Accessory 7", brand: "Brand 7", price: "47.77", quantity: "10", vape_id: "2", code: Time.now.to_i )
sleep 1.0
Accessory.create(name: "Accessory 6", brand: "Brand 6", price: "46.66", quantity: "10", vape_id: "2", code: Time.now.to_i )
sleep 1.0
