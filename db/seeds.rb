# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Clean database
puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

# 2. Create the instances
category = ["chinese", "italian", "japanese", "french", "belgian"]
puts "Creating Restaurants..."
10.times do
  restaurant = Restaurant.create!(address: Faker::Address.street_address, name: Faker::Restaurant.name, category: category.sample, phone_number: Faker::PhoneNumber.phone_number)
  puts "Created #{restaurant.name}"
end

# 3. Display result
puts "Finished! Successfully created #{Restaurant.count} restaurants"
