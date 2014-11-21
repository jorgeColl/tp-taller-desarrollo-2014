class UsersController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
def create
	@user = User.new(user_params)
	@user.coins = 0
	if @user.save
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
