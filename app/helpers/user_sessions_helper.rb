module UserSessionsHelper

  # Returns true if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Returns the current user if any
  def current_user
    User.find_by(id: session[:user_id])
  end

  # Logs out the user
  def logout
    session[:user_id] = nil
  end

  def require_login
    if !logged_in?
      flash[:warning] = "You should be logged in for this action!"
      redirect_to root_url
    end
  end
end
