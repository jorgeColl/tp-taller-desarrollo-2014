module SessionsHelper
  #basado en ejemplos de https://www.railstutorial.org/
  def login(user)
    session[:user_id] = user.id
  end
  
  def currentUser
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def loggedIn?
    !currentUser.nil?
  end
end
