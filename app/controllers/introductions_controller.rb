class IntroductionsController < ApplicationController
	before_filter :find_introductions,only: [:index,:show]

	def index		
		@introduction = Introduction.first
	end

	def show
		@introduction = Introduction.find(params[:id])
	end

	private
	def find_introductions
		@introductions = Introduction.all
	end

end
