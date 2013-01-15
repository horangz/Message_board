module AdsHelper

	def root
		current_user.admin == true
	end
	
	def admin?
		if !signed_in?
			redirect_to root_path
		else
			if !root
				redirect_to root_path
			end
		end	
	end
	
	def get_categories
		Category.all
	end
	
	def pp_name(check)
		if check == true
			return 'admin'
		else
			return 'ads'
		end	
	end
end
