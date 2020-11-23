def movie_attributes(overrides = {})
  {
                      title: "Iron Man",
                      raiting: "PG-13",
                      total_gross: 318412101.00,
                      description: "Tony Stark builds an armored suit to fight the throes of evil",
                      released_on: "2008-05-02",
                       image_file_name:"superman.jpg",
                        duration: 150


  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
   # name: "Roger Ebert",
    stars: 3,
    comment: "I laughed, I cried, I spilled my popcorn!",
    #user_id:1
  }.merge(overrides)
end

def user_attributes(overrides = {})
{name:'admin',
email:'admin@exemple.com',
password:'secret',
username:'admin',
admin:true
}.merge(overrides)

  end

  def sign_in(user)
  visit signin_url
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end
