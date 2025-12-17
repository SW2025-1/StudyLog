class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  #L4 -> isssue_session
  before_action :require_login #topコントローラー以外でログイン必須とする
  
  def issue_session
    session[:c] ||= 0
    session[:c] = session[:c].to_i + 1
    render plain: session[:c]
  end
  
  def enable_sidebar
    @show_sidebar = true
  end
  
  helper_method :current_user, :logged_in?
  
  
  private
  
  def current_user
    if session[:login_uid]
      User.find_by(email: session[:login_uid])
    end
  end
  
  def logged_in?
    session[:login_uid].present?
  end

  def require_login
    return if logged_in?

    redirect_to root_path  # Topページ（root 'top#main'）へ
  end
  
end
