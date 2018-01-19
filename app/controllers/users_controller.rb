class UsersController < ApplicationController

  def new
    #FIRST RUN
    if User.count == 0
      @user = User.new
      @user.email = 'john@gmail.com'
      @user.password = '1234'
      @user.password_confirmation = '1234'

      @user.save
    end
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to pictures_url, notice: "Logged in!"
      else
      redirect_to root_url
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
