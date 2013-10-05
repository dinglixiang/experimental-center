#encoding:utf-8
class NoticesController < ApplicationController
	def index
		#@notices = Notice.where(tag: "通知公告").in(state: 2).page(params[:page]).per(14)
		return @notices = Notice.where(tag: "通知公告").in(state: 2).page(params[:page]).per(14) if params[:tag].nil?
		@notices = Notice.where(tag: params[:tag]).in(state: 2).page(params[:page]).per(14)
	end
	def show
		@notice = Notice.find(params[:id])
	end
end
