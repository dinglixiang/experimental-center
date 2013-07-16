class AdminController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
		redirect_to admin_notices_path, :alert => exception.message
	end

end
