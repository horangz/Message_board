class PagesController < ApplicationController
  def home
		@title = 'Home'
  end
	
	def signup
		@title = 'Sign up'
  end
end
