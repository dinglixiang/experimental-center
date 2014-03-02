class VideosController < ApplicationController
	def index
		@videos = Video.all
	end
	def show
		# @video=Video.where.tagged_with(params[:tag])
		@video = Video.find(params[:id])
	end

end
