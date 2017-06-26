class UsersController < ApplicationController

  before_action :skip_if_logged_in, only: [:new, :create]
  before_action :require_login, only: [:index]

  def index
    @users = User.order(:name).where.not(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created for #{@user.name}"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:error] = "#{@user.errors.full_messages.to_sentence}"
      render 'new'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
