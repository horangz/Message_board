class AdsController < ApplicationController

	def get_all_categories
		Category.all
	end

  def index
		@title = 'Home'
		@ads = Ad.all
		@categories = Category.all
  end
	
	
	
	def show
		#@categories = get_all_categories
		@ad = Category.find(params[:id])
	end
end
