class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_email, user_password)
    if @user
      login!(@user)
      redirect_to root_url
    else
      flash[:errors] = ["Email or password incorrect."]
      @user = User.new(email: user_email)
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to root_url
  end

  private

  def user_email
    params[:user][:email]
  end

  def user_password
    params[:user][:password]
  end
end
