class GamblesController < ApplicationController
	#basado en ejemplos de https://www.railstutorial.org/
	def index
		@user = User.find_by(id: params[:user_id])
		if @user
			@gambles = @user.gambles
		end
	end
 	def new
     	@user = User.find_by(id: params[:user_id])
     	@gamble = @user.gambles.build
	end
    def create
    	@user = User.find_by(id: params[:user_id])
     	@gamble = @user.gambles.create(gamble_params)
     	@gamble.cost = 0
      @gamble.firstRaffled = 99
      @gamble.secondRaffled = 98
      @gamble.thirdRaffled = 97
      @gamble.fourthRaffled = 96
      @gamble.fifthRaffled = 95
      
     	if @gamble.save
    		redirect_to([@gamble.user, @gamble])
    	else
  	  		render 'new'
  		end
 	end
 	def show
		@user = User.find(params[:user_id])
    @gamble = @user.gambles.find(params[:id])
 	end
  private
  def gamble_params
    params.require(:gamble).permit(:firstChosen, :secondChosen, :thirdChosen,
                                 :fourthChosen, :fifthChosen)
  end
end
