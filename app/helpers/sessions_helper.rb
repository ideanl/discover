module SessionsHelper
  
  def require_login
    if !logged_in?
      session[:return_to_url] = request.url if request.get?
    end
  end

  def login(user)
    @current_user = nil

    old_session = session.dup.to_hash
    old_session.each do |key, value|
      session[key.to_sym] = value
    end

    session[:user_id] = user.id
    current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def redirect_back_or_to(url)
    redirect_to(session[:return_to_url] || url)
    session[:return_to_url] = nil
  end
end
