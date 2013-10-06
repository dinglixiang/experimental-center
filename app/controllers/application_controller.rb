class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_blogrolls

  def find_blogrolls
  	@blogrolls = Blogroll.all
  end

end
