# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[PaymentIntent,PaymentStatus,StockMovement,ProductStock,StockMovementType,Product,Category,Currency,Client].each(&:delete_all) # Ensure the DB is cleaned each run

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
Currency.create! name: 'USD', description: 'US Dollars'
Currency.create! name: 'EUR', description: 'EURO'

10.times do
currency = Currency.create! name: Faker::Currency.code, 
    description: Faker::Currency.name
end

10.times do
    
    category = Category.create! name: Faker::Commerce.department    

    
    product = category.products.create! code: Faker::Code.ean,
        name: Faker::Commerce.product_name,
        price: rand(100..10000),
        image: "#{category.id}.jpg",
        description: 'Product description',
        is_enabled: Faker::Boolean.boolean(true_ratio: 0.2),
        currency_id: rand(1..2)

        ProductStock.create! quantity: rand(20..80), product_id: product.id
    
end

10.times do
    name = Faker::Name.first_name
    Client.create! name: name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: '1234567', 
    password_confirmation: '1234567',
    username: Faker::Internet.username(specifier: name),    
    phone: Faker::PhoneNumber.cell_phone_in_e164
end


StockMovementType.create! name: 'add'
StockMovementType.create! name: 'subtract'

PaymentStatus.create! name: 'intent'
PaymentStatus.create! name: 'completed'
PaymentStatus.create! name: 'cancelled'

2.times do    
    PaymentIntent.create! client_secret: Faker::Crypto.sha256,
    amount: Faker::Commerce.price,
    payment_method_type: 'automatic',    
    client_id: rand(1..10),
    currency_id: rand(1..10),
    payment_status_id:rand(1..3)
end
