module ApplicationHelper
  def current_user
    User.find(session[:user_id] || 0)
  end
end
