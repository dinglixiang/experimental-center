class AdminController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  rescue_from CanCan::AccessDenied do |exception|
		redirect_to admin_root_path, :alert => exception.message
  end
 
  def authenticate_user
    if current_user.nil?
      flash[:alert] = t('devise.failure.unauthenticated')
      redirect_to signin_url
    end
  end

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    #render json: session[:user_id]
    @current_user ||= User.where(id: session[:user_id]) if session[:user_id]
  end

end
