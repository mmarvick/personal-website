module ApplicationHelper
	def full_title(page_title)
		base_title = "Michael Marvick"
		full_title = base_title + (page_title.empty? ? '' : (' | ' + page_title))
	end
end
