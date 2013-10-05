class SessionsController < ApplicationController
	layout "login"
	before_filter :login_exist?, only: [:create] 
	

	#登录
	def new

	end

	#sign up
	def create	 	
		user = User.find_by login: params[:session][:login]
		if user && user.authentication(user,params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = t('devise.sessions.signed_in')
			redirect_to admin_root_path
		else
			flash[:alert] = t('devise.failure.invalid')
		    redirect_to signin_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:alert] = t('devise.sessions.signed_out')
		redirect_to signin_path
	end

	private
	def login_exist?
		redirect_to signin_path,alert: t('devise.failure.invalid') unless User.where(login: params[:session][:login]).exists?
	end
end
