class ShoppingsController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/
  before_action :loggedInUser
  before_action :correctUser
	def index
		@user = User.find_by(id: params[:user_id])
		if @user
			@shoppings = @user.shoppings
		end
	end
 	def new
     	@user = User.find_by(id: params[:user_id])
     	@shopping = @user.shoppings.build
	end
  def create
  	@user = User.find_by(id: params[:user_id])
   	@shopping = @user.shoppings.create(shopping_params)
   	if @shopping.save
        coins = @user.coins + @shopping.amount
        @user.update_attribute('coins',coins)
  	   	redirect_to user_shoppings_path
    	else
	  		render 'new'
		end
 	end
 	def show
 	end

  private
  def shopping_params
    params.require(:shopping).permit(:amount)
  end

  def correctUser
    @user = User.find_by(id: params[:user_id])
    redirect_to(root_url) unless currentUser?(@user)
  end

end
