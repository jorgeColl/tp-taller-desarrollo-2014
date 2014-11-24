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
     	@gamble.save
    	redirect_to	user_gambles_path
 	end

  private
  def gamble_params
    params.require(:gamble).permit(:firstChosen, :secondChosen, :thirdChosen,
                                 :fourthChosen, :fifthChosen)
  end
end
