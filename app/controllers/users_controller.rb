class UsersController < ApplicationController

  def index
    @users = User.all.shuffle
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created!"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "#{@user.errors.full_messages.to_sentence}"
      redirect_to sign_up_path
    end

  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
