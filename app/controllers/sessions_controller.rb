class SessionsController < ApplicationController
	#sign in
	def new
	end

	#sign up
	def create
		user = User.authentication(params[:login],params[:password])
		if user
			#session[:user_id] = user.id
			flash[:notice] = t('devise.sessions.signed_in')
			redirect_to admin_root_path
		else
			flash[:notice] = t('devise.failure.invalid')
			redirect_to root_path
		end
	end
end
