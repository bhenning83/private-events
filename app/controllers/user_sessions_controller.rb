class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      flash[:success] = 'Successfully logged in!'
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:warning] = 'No user found'
      render :new
    end
  end

  def destroy
    logout if logged_in?
    flash[:success] = 'Loggout out.'
    redirect_to root_url
  end

end
