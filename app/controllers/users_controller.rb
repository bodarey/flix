class UsersController < ApplicationController

  before_action :require_signin, except:[:new,:create]
  before_action :require_correct_user, only: [:update,:edit,:destroy]
 

#####################################################
def index
  @users =  User.all
end  
#####################################################
def show
@user =User.find params[:id]
@reviews =@user.reviews
@favorite_movies=@user.favorite_movies
end
#####################################################
def new
  @user =User.new
end
#####################################################
def create
    @user=User.new params_user
      if @user.save
        session[:user_id] =  @user.id
            flash[:notice] = "Thanks for signing up!"
         redirect_to(@user)
      else
        render :new
      end 
end  
#####################################################
def edit
      #@user =User.find params[:id]

  end
#####################################################
def update
 #   @user =User.find params[:id]
if @user.update params_user
            redirect_to @user, notice: 'Account successfully updated!'
         else
            render :edit
          end  
  end
#####################################################
def destroy
  # @user =User.find params[:id]
   @user.destroy
   session[:user_id]=nil
   redirect_to root_path, notice:'Account successfully deleted!'
end  
#####################################################
private
def params_user
params.require(:user).permit(:name,:email,:password,:password_confirmation,:username)
end
#########

########
def require_correct_user
  @user=User.find params[:id]
  unless current_user? @user
    redirect_to root_path
  end
  end

 
end
