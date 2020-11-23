class ReviewsController < ApplicationController
before_action  :get_movie
before_action :require_signin, except:[:show,:index]
#####################################################
def index

@reviews=@movie.reviews

end
#####################################################
def new
@review=@movie.reviews.new
end
#####################################################
def create
@review = @movie.reviews.new review_params
@review.user =current_user
if @review.save 
redirect_to movie_reviews_path(@movie), notice:"Thanks for your review!"
else 
  render :new

end
end
#####################################################
def show
  @review = get_review
end
#####################################################
 def edit 
   @review = get_review


 end
# #####################################################
def update
  @review = get_review
  if @review.update review_params
    flash[:notice]="Review successfully updated!"
    redirect_to movie_review_path(@movie,@review)

  else
    render :edit
  end
end
#####################################################
def destroy
  @review = get_review
  if @review.destroy
    flash[:alert]="Review successfully deleted!"
  redirect_to movie_reviews_path @movie
  else 
    render :show
  end
end
#####################################################






private
def review_params

  params.require(:review).permit(:stars,:comment,:city,:state)

end

def get_movie
@movie =Movie.find_by(slug: params[:movie_id])
end

def get_review
  @review = Review.find params[:id]
end
end
