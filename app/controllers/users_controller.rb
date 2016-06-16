class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
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
	   render 'new'
	 end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation, :area, :user_profile)
  end
end
