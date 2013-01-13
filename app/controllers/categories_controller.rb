class CategoriesController < ApplicationController
  def new
  end
	
	def show
		@cats = Category.all
		@cat = Category.find(params[:id])
		@ads_by_cat = @cat.ads.all
		@title = @cat.name
	end
end
