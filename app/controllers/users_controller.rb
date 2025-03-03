class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # Обработать успешное сохранение.
      flash[:success] = "Welcome to the Website!"
      redirect_to @user
      # redirect_touser_url(@user)
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
