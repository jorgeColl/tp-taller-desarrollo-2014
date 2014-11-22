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
   def logout
      if loggedIn?
        session.delete(:user_id)
        @current_user = nil
      end
    end
end
