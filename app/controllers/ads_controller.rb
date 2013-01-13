class AdsController < ApplicationController

	def new
		@ad = Ad.new
		@cats = Category.all
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
	
	def edit
		@cats = Category.all
		@ad = Ad.find(params[:id])
		@title = 'Edit ad'
	end
	
	def update
		@ad = Ad.find(params[:id])
		if @ad.update_attributes(params[:ad])
			redirect_to root_path
		else
			@title = 'Edit ad'
			render 'edit'
		end
	end
end
