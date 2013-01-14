class AdsController < ApplicationController

	def new
		@ad = Ad.new
		@cats = Category.all
	end
	
	def create
		@ad = Ad.new(params[:ad])
		if @ad.save
			if root
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
		if root
			redirect_to '/admin'
		else	
			redirect_to root_path
		end	
	end
	
	def edit
		@cats = Category.all
		@ad = Ad.find(params[:id])
		@title = 'Edit ad'
	end
	
	def update
		@ad = Ad.find(params[:id])
		if @ad.update_attributes(params[:ad])
			if root
				redirect_to '/admin'
			else	
				redirect_to root_path
			end	
		else
			@title = 'Edit ad'
			render 'edit'
		end
	end
	
	def admin
		@ads_per_page = Ad.page(params[:page])
		@cats = Category.all
	end
	
	def get_category
		@cats = Category.all
		@cat = Category.find(params[:id])
		@ads_by_cat = @cat.ads.all
		@title = @cat.name
	end
	
	def uploadFile
    post = Ad.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
