class SessionController < ApplicationController

  #LOGIN PAGE
  def new
  end

  #LOGS USER IN
  def create
    user = User.where(:name => params[:name]).first
    #encrypts and checks password against database, returns true or false if user logged in successfully
    if user.present? && user.authenticate(params[:password])
      #set the session hash to include the user's id
      session[:user_id] = user.id
      redirect_to root_path
    else
      #if they are already logged in and get the password wrong, log them out
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  #LOGS USER OUT
  def destroy
    #nullify the session id
    session[:user_id] = nil
    redirect_to root_path
  end

end
