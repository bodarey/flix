class SessionsController < ApplicationController

  #####################################################
  def new

  end
  #####################################################
  def create
  if user =User.authenticate(params[:email],params[:password],params[:username])

     
             session[:user_id] =  user.id
             flash[:notice]= "Welcome back, #{user.name}!"
             redirect_to(session[:intendend_url] || user)
             session[:intendend_url]=nil
           else
            flash.now[:alert] = 'Invalid Bzzt... wrong answer! '
            render :new 
     end
  end
  #####################################################
  def destroy
    
    session[:user_id] = nil
    flash[:notice] = 'You are signed out!'
     
    redirect_to root_path
  end
  #####################################################
  #####################################################

end
