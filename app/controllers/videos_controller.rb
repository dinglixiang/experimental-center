class VideosController < ApplicationController
	def index
		@videos = Video.all
	end
	def show
		# @video=Video.where.tagged_with(params[:tag])
		@video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
	end
end
