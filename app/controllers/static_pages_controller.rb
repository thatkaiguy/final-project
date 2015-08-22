class StaticPagesController < ApplicationController
  # before_action :check_login

  def check_login
    redirect_to new_session_url unless logged_in?
  end

  def root
  end
end
