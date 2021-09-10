class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
       highest_rating = self.reviews.maximum(:star_rating)
        
    end

    def remove_reviews(product)
        review = self.reviews.find_by_product_id(product.id)
        if review != nil
            review.destroy 
        end
    end
end