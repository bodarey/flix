class GenresController < ApplicationController

  before_action :require_signin,except: [:index,:show]
  before_action :require_admin, except:[:index,:show]
  before_action :get_genre, only: [:destroy,:edit,:update,:show]

  ###############################################
 def index
  @genres = Genre.all
 end
  ###############################################
 def create
  @genre = Genre.new genre_params
  if @genre.save 
    redirect_to genres_path, notice:'A new genre was added'
  else
    render :new
  end
 end
  ###############################################
 def edit
 end
  ###############################################
 def update
  if   @genre.update genre_params
 redirect_to genres_path, notice:'Genre has been updated'
  else
    render :edit
  end
 end
  ###############################################
 def destroy
  @genre.destroy
   redirect_to genres_path, notice:'Genre has been deleted'
 end
  ###############################################
 def new
  @genre =Genre.new
 end
  ###############################################
 def show
@genre_movies =@genre.movies
 end
  ###############################################

  private
  def get_genre
    @genre =Genre.find params[:id]
  end

  def genre_params 
    params.require(:genre).permit(:name)
    
  end
end
