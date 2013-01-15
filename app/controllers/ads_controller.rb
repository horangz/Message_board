class AdsController < ApplicationController

	def new
		@ad = Ad.new
		@cats = Category.all
		@title = 'New ad'
	end
	
	def create
		@ad = Ad.new(params[:ad])
		if @ad.save
			if !admin?
				redirect_to '/admin'
			else	
				redirect_to root_path
			end	
		end	
	end

  def index
		@title = 'All ads'
		@ads_per_page = Ad.page(params[:page])
		@cats = Category.all
  end
	
	def destroy
		Ad.find(params[:id]).destroy
		if !admin?
			redirect_to '/admin'
		else	
			redirect_to root_path
		end	
	end
	
	def edit
		@ad = Ad.find(params[:id])
		@cats = Category.all
		@title = 'Edit ad'
	end
	
	def update
		@ad = Ad.find(params[:id])
		if @ad.update_attributes(params[:ad])
			if !admin?
				redirect_to '/admin'
			else	
				redirect_to root_path
			end	
		else
			render 'edit'
		end
	end
	
	def admin
		admin?
		@ads_per_page = Ad.page(params[:page])
		@cats = get_categories
	end
	
	def get_category
		@cats = Category.all
		@cat = Category.find(params[:id])
		@ads_by_cat = @cat.ads.all
		@title = @cat.name
	end
end
