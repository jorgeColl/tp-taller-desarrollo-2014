class SessionsController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/

  def new
  end
  def create
    user = User.find_by(nickname: params[:session][:nickname].downcase)
    if user && user.authenticate(params[:session][:password])
   	  login user
      redirect_to user
    else
      render 'new'
    end
  end
end
