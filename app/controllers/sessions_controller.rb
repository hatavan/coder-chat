class SessionsController < ApplicationController

  before_action :skip_if_logged_in, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Logged In!'
        redirect_to messages_path
      else
        flash[:error] = 'Invalid password!'
        redirect_to login_path
      end
    else
      flash[:error] = "Cannot found user by email #{params[:email]}!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
