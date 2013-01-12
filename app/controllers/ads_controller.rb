class AdsController < ApplicationController

	def new
		@ad = Ad.new
	end
	
	def create
		@ad = Ad.new(params[:ad])
		if @ad.save
			redirect_to root_path
		else
		end	
	end

	def get_all_categories
		Category.all
	end

  def index
		@title = 'All ads'
		@ads = Ad.page(params[:page])
		@adss = Ad.all
  end
		
	def show
		#@ad = Category.find(params[:id])
	end
	
	def destroy
		Ad.find(params[:id]).destroy
		redirect_to root_path
	end
end
