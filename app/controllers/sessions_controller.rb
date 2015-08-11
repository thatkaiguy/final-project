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
      # TODO flash message?
      @user = User.new(email: user_email)
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

  private

  def user_email
    params[:user][:username]
  end

  def user_password
    params[:user][:password]
  end
end
