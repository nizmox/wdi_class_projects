class UsersController < ApplicationController
  before_filter :check_if_logged_in, :only => [:create, :new]
  before_filter :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(params['user'])
    
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @current_user.nil || @current_user.admin == false
  end

end
