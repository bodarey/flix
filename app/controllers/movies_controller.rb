class MoviesController < ApplicationController
   before_action :require_signin, except:[:index,:show]
   before_action :require_admin, except:[:index,:show]
   before_action :set_movie, only: [:show,:update,:edit,:destroy]

  #####################################################
  def index
   case params[:scope]
   when 'hits'
     @movies=Movie.hits
    #@movies=Movie.all
     when 'flops'
      @movies=Movie.flops
     when 'upcoming'
      @movies=Movie.upcoming
        when 'recent'
      @movies=Movie.recent
        when 'released'
      @movies=Movie.released
  else
    @movies=Movie.all
 end
  end

#####################################################
def show
  #@movie=Movie.find params[:id]

  @review= @movie.reviews.new
  @fans =@movie.fans
  @genres =@movie.genres

  if current_user
  @current_favorite=current_user.favorites.find_by movie_id: @movie.id
  end
end

#####################################################
def edit
  #@movie = Movie.find params[:id]
end 
#####################################################
def update
 #@movie =Movie.find params[:id]
if @movie.update movie_data
flash[:notice]="Movie successfully updated!"
redirect_to @movie
else
  render :edit
end
end
#####################################################
def new
  @movie =Movie.new
end
#####################################################
def create
  @movie = Movie.new movie_data

 if @movie.save
  flash[:notice]="Movie successfully created!"
  redirect_to @movie
else 
  render 'new'
end
end
#####################################################
def destroy
#@movie =Movie.find params[:id]
if @movie.destroy
  flash[:alert]="Movie successfully deleted!"
redirect_to movies_path
else 
  render :show
end
end
#####################################################

#####################################################

private
def movie_data
params.require(:movie).permit(:title,:description,:released_on,:raiting,:total_gross,:decimal,:director,:image_file_name,:cast,:duration,:slug,genre_ids: [] )
end
#####################################################
def set_movie
@movie =Movie.find_by(slug: params[:id])

end
###########################

end
