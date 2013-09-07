#encoding:utf-8
class NoticesController < ApplicationController
	def index
		@notices = Notice.where(state: 2).page(params[:page]).per(14)
	end
	def show
		@notice = Notice.find(params[:id])
	end
end
