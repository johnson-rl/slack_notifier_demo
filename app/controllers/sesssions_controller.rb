class SesssionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "You are now logged in."
      redirect_to @user
    else
      flash[:notice] = "Incorrect Login."
      redirect_to login_path
    end
  end
  def destroy
    logout
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end
  private
  # def user_params
    # params.require(:user).permit(:email, :password)
  # end
end
