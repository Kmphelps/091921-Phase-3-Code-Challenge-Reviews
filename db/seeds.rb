# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here

review1 = Review.create(star_rating: 5, comment: "This was great", product_id: product1.id, user_id: user1.id)
review2 = Review.create(star_rating: 2, comment: "This was not super great", product_id: product2.id, user_id: user2.id)
review3 = Review.create(star_rating: 4, comment: "This was pretty okay", product_id: product1.id, user_id: user1.id)

puts "Seeding done!"
puts "Review#user returns the instance for this Review"
puts review1.user.name
puts
puts "Review#product returns the Product instance for this Review"
puts review1.product.name 
puts
puts "Product#reviews returns a collection of all the Reviews for the Product"
puts product1.reviews.map(&:comment)
puts
puts "Product#users returns a collection of all the Users who reviewed the Product"
puts product1.users.map(&:name)
puts
puts "User#reviews returns a collection of all the Reviews that the User has given"
puts user1.reviews.map(&:comment)
puts
puts "User#products returns a collection of all the Products that the User has reviewed"
puts user1.products.map(&:name)
puts
puts "Print review1"
puts review1.print_review
puts
puts "Leaving a review for product3"
puts product3.leave_review(user3, 2, "I liked it a lot!")
puts
puts "Print all reviews for product1"
puts product1.print_all_reviews
puts
puts "Returns the product instance that has the highest star rating from particular user"
puts user1.favorite_product
puts
puts "Removes a user's reviews for product3"
puts user3.remove_reviews(product3)
puts 
