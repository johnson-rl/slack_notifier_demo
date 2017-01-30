class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    login(@user)
    notifier.ping "A new user named #{current_user.name} has joined your site!"
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
