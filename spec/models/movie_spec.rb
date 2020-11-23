# require 'rails_helper'

# RSpec.describe Movie, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"




#    before do
#   @user = User.create!(user_attributes)
#  # sign_in(@user)
# end

#   it "belongs to a movie" do
#     movie = Movie.create(movie_attributes)

#     review = movie.reviews.new(review_attributes)
#     review.user=@user
#     expect(review.movie).to eq(movie)
#   end

#   it "with example attributes is valid" do
#     movie = Movie.create(movie_attributes)

#     review = Review.new(review_attributes)
#     review.user=@user
#     review.movie = movie
    
#     expect(review.valid?).to eq(true)
#   end



#   it "requires a comment" do
#     review = Review.new(comment: "")

#     review.valid?

#     expect(review.errors[:comment].any?).to eq(true)
#   end

#   it "requires a comment over 3 characters" do
#     review = Review.new(comment: "X" * 2)

#     review.valid?

#     expect(review.errors[:comment].any?).to eq(true)
#   end

#   it "accepts star values of 1 through 5" do
#     stars = [1, 2, 3, 4, 5]
#     stars.each do |star|
#       review = Review.new(stars: star)

#       review.valid?

#       expect(review.errors[:stars].any?).to eq(false)
#     end
#   end

#   it "rejects invalid star values" do
#     stars = [-1, 0, 6]
#     stars.each do |star|
#       review = Review.new(stars: star)

#       review.valid?

#       expect(review.errors[:stars].any?).to eq(true)
#       expect(review.errors[:stars].first).to eq("must be between 1 and 5")
#     end
#   end

#   it "calculates the average number of review stars" do
#     movie = Movie.create(movie_attributes)
  
#    @review= movie.reviews.new(review_attributes(stars: 1,user_id: 1))
#     @review.user=@user
#     @review.save
#    # movie.reviews.create(review_attributes(stars: 3,user_id: 12))
    
#     #movie.reviews.create(review_attributes(stars: 5,user_id: 12))
   
#     expect(movie.average_stars).to eq(1)
#   end

# end