class GamblesController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/
  before_action :loggedInUser
  before_action :correctUser

  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @gambles = @user.gambles
      @gambleAll = Gamble.all
    end
  end

  def new
      @user = User.find_by(id: params[:user_id])
      @gambleAll = Gamble.all
      @gamble = @user.gambles.build
  end

  def create
    @user = User.find_by(id: params[:user_id])
    price = 15
    @gambleAll = Gamble.all
    if @user.coins >= price
      @gamble = @user.gambles.create(gamble_params)
      @gamble.cost = 0
      raffledNumbers = generateRaffledNumbers
      @gamble.firstRaffled = raffledNumbers[0]
      @gamble.secondRaffled = raffledNumbers[1]
      @gamble.thirdRaffled = raffledNumbers[2]
      @gamble.fourthRaffled = raffledNumbers[3]
      @gamble.fifthRaffled = raffledNumbers[4]
      @gamble.profit = calculateProfit(@gamble)
      if @gamble.save
          coins = @user.coins + @gamble.profit - price
          @user.update_attribute('coins',coins) 
          redirect_to([@gamble.user, @gamble])
      else
          render 'new'
      end
    else
      redirect_to error_path
    end
  end
  def show
    @user = User.find(params[:user_id])
    @gamble = @user.gambles.find(params[:id])
  end

  private
  def calculateProfit(gamble)
    correctCount = 0
    chosenNumbers = [ gamble.firstChosen, gamble.secondChosen, gamble.thirdChosen, gamble.fourthChosen, gamble.fifthChosen ]
    raffledNumbers = [ gamble.firstRaffled, gamble.secondRaffled, gamble.thirdRaffled, gamble.fourthRaffled, gamble.fifthRaffled ]
    for i in 0..4
      for j in 0..4
          #i know there are no equal numbers on each array
          if chosenNumbers[i] == raffledNumbers[j]
            correctCount = correctCount + 1
          end
      end
    end
    correctCount
  end

  def generateRaffledNumbers()
    numbersAreDifferent = false
    while (!numbersAreDifferent) do 
      numbersAreDifferent = true
      raffledNumbers = [ rand(100), rand(100), rand(100), rand(100), rand(100) ]
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
