class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :check_current_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "さんぷるあぷりのせかいへようこそ"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @follow = User.find(params[:id]).following_users
    @title = "followings"
    render 'follow'
  end
  
  def followers
    @follow = User.find(params[:id]).follower_users
    @title = "followers"
    render 'follow'
  end
  
  private
  def edit
    @user = current_user
  end
  
  def update
	   @user = current_user
	   @user.update_attributes(user_params)
	   if @user.save
	     flash[:success] = "こうしんされました"
	   redirect_to @user
	   else
	   render 'edit'
	   end
  end
  
  def check_current_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation, :area, :user_profile)
  end
end
