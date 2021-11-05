module SessionsHelper
   def current_user
    User.find_by(id: session[:user_id])
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    return false if session[:user_id].nil?
    return true
  end

  def is_owner?(id)
    return false if current_user.nil?
    return true if current_user.id == id
  end
end