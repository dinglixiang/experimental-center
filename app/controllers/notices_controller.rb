class NoticesController < ApplicationController
	def index
		@notices = Notice.where(:state => true)
	end
	def show
		@notice = Notice.find(params[:id])
	end
end
