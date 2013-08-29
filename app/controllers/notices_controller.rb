#encoding:utf-8
class NoticesController < ApplicationController
	def index
		@notices = Notice.where(:state => true).tagged_with(params[:tag])
	end
	def show
		@notice = Notice.find(params[:id])
	end
end
