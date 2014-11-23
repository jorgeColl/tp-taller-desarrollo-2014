class GamblesController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@gambles = @user.gambles
	end
end
