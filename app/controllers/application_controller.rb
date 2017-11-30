class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def admin?
    if current_user.permission_level == 1 || current_user.id == 1
      return true
    else
      return false
    end
  end

  def owner?(id)
    if current_user.id == id
      return true
    else
      return false
    end
  end

  def admin_or_owner?(id)
    if (admin? || owner?(id))
      return true
    else
      return false
    end
  end

  def admin_required
    unless current_user && (current_user.permission_level == 1 || current_user.id == 1)
      redirect_to '/'
    end
  end

  def admin_or_owner_required(id)
    unless current_user.id == id || current_user.permission_level == 1 || current_user.id == 1
      redirect_to '/'
    end
  end

end
