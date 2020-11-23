# require 'rails_helper'

# describe "Viewing the list of movies" do
#   before do  


#   @user = User.create!(user_attributes)
#   sign_in(@user)


#       @movie1 = Movie.create(title: "Iron Man",
#                       raiting: "PG-13",
#                       total_gross: 318412101.00,
#                       description: "Tony Stark builds an armored suit to fight the throes of evil",
#                       released_on: "2008-05-02",
#                        image_file_name:"superman.jpg",
#                         duration: 150
#                         );

# @movie2 = Movie.create(title: "Superman",
#                       raiting: "PG",
#                       total_gross: 134218018.00,
#                       description: "Clark Kent grows up to be the greatest super-hero",
#                       released_on: "1978-12-15",
#                        image_file_name:"superman.jpg",
#                         duration: 150
#                       );

# @movie3 = Movie.create(title: "Spider-Man",
#                       raiting: "PG-13",
#                       total_gross: 403706375.00,
#                       description: "Peter Parker gets bit by a genetically modified spider",
#                       released_on: "2022-05-03",
#                        image_file_name:"superman.jpg",
#                        duration: 150
#                        )
    
#   end

  
# it "shows the movies" do
  
  
#   visit root_path
#     expect(page).to have_text("3 Movies")
#   expect(page).to have_text(@movie1.title)
#   expect(page).to have_text(@movie2.title)
#   expect(page).to have_text(@movie3.title)
#   expect(page).to have_text(@movie3.description)
#   expect(page).to have_text('318,412,101.0')
# end


# require 'rails_helper'

# describe "Deleting a movie" do
#   it "destroys the movie and shows the movie listing without the deleted movie" do
    
#     visit movie_path(@movie1)

#     click_link 'Delete'

#     expect(current_path).to eq(movies_path)
#     expect(page).not_to have_text(@movie1.title)
#   end
# end


# it "is released when the released on date is in the past" do
  

#   expect(Movie.released).to include(@movie2)
# end

# it "is not released when the released on date is in the future" do
  

#   expect(Movie.released).not_to include(@movie3)
# end

# it "returns released movies ordered with the most recently-released movie first" do


#   expect(Movie.released).to eq([ @movie1, @movie2])
# end

# end