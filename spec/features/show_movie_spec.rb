# require 'rails_helper'

# describe "View a movie" do
#   before do 
 
#      @movie = Movie.create(title: "Iron Man",
#                       raiting: "PG-13",
#                       total_gross: 60000000.00,
#                       description: "Tony Stark builds an armored suit to fight the throes of evil",
#                       released_on: "2008-05-02",
#                        image_file_name:"superman.jpg",
#                         duration: 150
#                         )
# end
#  it "show the movie" do
#  visit movie_url(@movie)
#  expect(page).to have_text(@movie.title)

#    end

# it "shows the total gross if the total gross exceeds $50M" do

  
#   visit movie_url(@movie)
  
#   expect(page).to have_text("$60,000,000.00")
# end


# it "shows 'Flop!' if the total gross is less than $50M" do

# end
# ####################################################################

# it "shows the movie's fans and genres in the sidebar" do
#   movie = Movie.create!(movie_attributes)

#   user = User.create!(user_attributes)
#   movie.fans << user

#   genre = Genre.create!(name: "Action")
#   movie.genres << genre

#   visit movie_url(movie)

#   within("div#sidebar") do
#     expect(page).to have_text(user.name)
#     expect(page).to have_text(genre.name)
#   end
# end

# it "includes the movie's title in the page title" do
#   movie = Movie.create!(movie_attributes)

#   visit movie_url(movie)

#   expect(page).to have_title("Flix - #{movie.title}")
# end

# it "has an SEO-friendly URL" do
#   movie = Movie.create!(movie_attributes(title: "X-Men: The Last Stand"))

#   visit movie_url(movie)

#   expect(current_path).to eq("/movies/x-men-the-last-stand")
# end

# end