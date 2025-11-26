class TopController < ApplicationController
  def login_form
  end
  
  def login
    user = User.find_by(email: params[:email])
    if user != nil and user.authenticate(params[:password])
      session[:login_uid] = params[:email]
      redirect_to top_main_path
    else
      render :login_form, status: :unprocessable_entity
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to login_form_path
  end
end