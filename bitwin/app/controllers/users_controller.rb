class UsersController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/
  def show
    @user = User.find(params[:id])
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
  	  render 'new'
  	end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :mail, :password,
                                 :password_confirmation, :walletNmb)
  end
end
