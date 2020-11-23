# require 'rails_helper'

# describe "Creating a new movie" do
#   it "saves the movie and shows the new movie's details" do
#     visit movies_url

#     click_link 'Add New Movie'

#     expect(current_path).to eq(new_movie_path)

#     fill_in "movie_title", with: "New Movie Title"
#     fill_in "movie_description", with: "Superheroes saving the world from villains"
#   select "PG-13", :from => "movie_raiting"
#     fill_in "movie_total_gross", with: 75000
#       fill_in "movie_released_on", with: (Time.now.year - 1).to_s
#       fill_in "movie_duration", with: '210'
#       fill_in "movie_image_file_name",with: "superman.jpg"

#     #select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"

#     # If you're taking advantage of the HTML 5 date field in Chrome,
#     # you'll need to use 'fill_in' rather than 'select'
#     # fill_in "Released on", with: (Time.now.year - 1).to_s

#     click_button 'Submit'
# link ="/movies/#{Movie.last}"
#     expect(current_path).to eq(link)

#     expect(page).to have_text('New Movie Title')
#   end
# end
require 'rails_helper'

describe "Creating a new movie" do
  before do 
     @genre1 = Genre.create!(name: "Genre 1")
  @genre2 = Genre.create!(name: "Genre 2")
  @genre3 = Genre.create!(name: "Genre 3")
  end
  it "saves the movie and shows the new movie's details" do
     user = User.create!(user_attributes)
    sign_in user
    visit movies_url

    click_link 'Add New Movie'

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world from villains"
    
    fill_in "Total gross", with: "75000000"
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    #select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in "Cast", with: "The award-winning cast"
    fill_in "Director", with: "The ever-creative director"
    fill_in "Duration", with: "123 min"
    fill_in "Image file name", with: "superman.jpg"
    select "PG-13", :from => "movie_raiting"

    # If you're taking advantage of the HTML 5 date field in Chrome,
    # you'll need to use 'fill_in' rather than 'select'
    # fill_in "Released on", with: (Time.now.year - 1).to_s
    check(@genre1.name)
    check(@genre2.name)

    click_button 'Submit'

    expect(current_path).to eq(movie_path(Movie.last))
    expect(page).to have_text('New Movie Title')
     expect(page).to have_text('Movie successfully created!')

     expect(page).to have_text(@genre1.name)
     expect(page).to have_text(@genre2.name)
     expect(page).not_to have_text(@genre3.name)
  end

it "does not save the movie if it's invalid" do
  user = User.create!(user_attributes)
    sign_in user
  visit new_movie_url
  
  expect { 
    click_button 'Submit' 
  }.not_to change(Movie, :count)
  
  expect(current_path).to eq(movies_path)   
  expect(page).to have_text('error')
end


it "does not update the movie if it's invalid" do
  user = User.create!(user_attributes)
    sign_in user
  movie = Movie.create(movie_attributes)
  
  visit edit_movie_url(movie)
  
  fill_in 'Title', with: " "
  
  click_button 'Submit' 
      
  expect(page).to have_text('error')

end



end
