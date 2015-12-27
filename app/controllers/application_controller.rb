class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_user!
    redirect_to pending_path unless current_user.approved?
  end

  def check_admin!
    redirect_to root_path, alert: "You do not have sufficient privileges to access that page." unless current_user.admin?
  end

  def check_campus_captain!
    redirect_to root_path, alert: "You do not have sufficient privileges to access that page." unless current_user.campus_captain?
  end

  def check_admin_or_captain!
    redirect_to root_path, alert: "You do not have sufficient privileges to access that page." unless current_user.admin? || current_user.campus_captain?
  end
end
