# require 'rails_helper'

# describe ReviewsController do

#   before do
#       @user = User.create!(user_attributes)
#   sign_in(@user)
#     @movie = Movie.create!(movie_attributes)
#   end

#   context "when not signed in" do

#     before do
#       session[:user_id] = nil
#     end

    

#     it "cannot access new" do
#       get :new, params: { movie_id: @movie }

#       expect(response).to redirect_to(new_session_url)
#     end

#     it "cannot access create" do
#       post :create, params: { movie_id: @movie }

#       expect(response).to redirect_to(new_session_url)
#     end
#   end
# end
