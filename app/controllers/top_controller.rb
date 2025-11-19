class TopController < ApplicationController
  def main
    
  end
  
  def login
    
    user = User.find_by(email: params[:email])
    
    if user != nil and user.authenticate(params[:password])
      session[:login_uid] = params[:uid]
      # redirect_to #FIXIT: redirect先を設定！！！！
    else
      render "error", status: 442
    end
  end
  
  def logout
    session.delete(:login_uid)
    # redirect_to #FIXIT: redirect先を設定！！！！
  end
end
