class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    u = User.new(email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
    if User.find_by(email: params[:user][:email]) != nil
      flash[:alert] = "※ このメールアドレスは登録済みです"
      redirect_to new_user_path
    else
      u.save
      redirect_to notes_path
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to top_main_path
  end

end