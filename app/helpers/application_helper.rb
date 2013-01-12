module ApplicationHelper

	def title
		base_title = "Message board"
		if @title.nil?
			base_title
		else
			"#{base_title} - #{@title}"
		end
	end
	
	def logo
		image_tag('news.png', alt: 'News', class: 'image')
	end
end
