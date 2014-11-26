class GamblesController < ApplicationController
	#basado en ejemplos de https://www.railstutorial.org/
  before_action :loggedInUser
  before_action :correctUser

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
      raffledNumbers = generateRaffledNumbers
     	@gamble.firstRaffled = raffledNumbers[0]
      @gamble.secondRaffled = raffledNumbers[1]
      @gamble.thirdRaffled = raffledNumbers[2]
      @gamble.fourthRaffled = raffledNumbers[3]
      @gamble.fifthRaffled = raffledNumbers[4]
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
  def generateRaffledNumbers()
    numbersAreDifferent = false
    while (!numbersAreDifferent) do 
      numbersAreDifferent = true
      raffledNumbers = [ rand(99), rand(99), rand(99), rand(99), rand(99) ]
      for i in 0..4
        for j in i..4
            if i != j and raffledNumbers[i] == raffledNumbers[j]
              numbersAreDifferent = false
            end
        end
      end
    end
    raffledNumbers
  end
  def gamble_params
    params.require(:gamble).permit(:firstChosen, :secondChosen, :thirdChosen,
                                 :fourthChosen, :fifthChosen)
  end

  def correctUser
    @user = User.find_by(id: params[:user_id])
    redirect_to(root_url) unless currentUser?(@user)
  end
end
