class UsersController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/
  before_action :loggedInUser, only: [:show, :destroy]
  before_action :correctUser,   only: [:show, :destroy]

  def show
    if loggedIn? 
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    if loggedIn? 
     redirect_to currentUser 
    else
     @user = User.new   
    end
  end

  def create
  	@user = User.new(user_params)
  	@user.coins = 0
  	if @user.save
        login @user
        redirect_to @user
  	else
  	  redirect_to root_path
  	end
  end

 def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end
  private

  def user_params
    params.require(:user).permit(:nickname, :mail, :password,
                                 :password_confirmation, :walletNmb)
  end


  def correctUser
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless currentUser?(@user)
  end
end
