class AdsController < ApplicationController

	def new
		@ad = Ad.new
	end
	
	def create
		@ad = Ad.new(params[:ad])
		if @ad.save
			redirect_to root_path
		end	
	end

  def index
		@title = 'All ads'
		@ads = Ad.page(params[:page])
		@adss = Ad.all
		@cats = Category.all
  end
	
	def destroy
		Ad.find(params[:id]).destroy
		redirect_to root_path
	end
end
