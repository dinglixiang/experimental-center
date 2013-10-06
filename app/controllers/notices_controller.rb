#encoding:utf-8
class NoticesController < ApplicationController
	def index
		#@notices = Notice.where(tag: "通知公告").in(state: 2).page(params[:page]).per(14)
		@notices = Notice.has_passed.recent_notices.page(params[:page]).per(14)
	end
	def show
		@notice = Notice.find(params[:id])
	end

	def news
		@notices = Notice.has_passed.recent_news.page(params[:page]).per(14)
	end
end
