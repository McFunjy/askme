class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id

    redirect_to root_path, notice: 'Регистрация прошла успешно!'
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password)
  end
  
end
