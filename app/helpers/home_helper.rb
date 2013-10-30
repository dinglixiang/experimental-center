module HomeHelper
	def truncate_str(text)
		if text.length > 6
		  text[0,6].to_s << ".."
		else
			text << "    "
		end
	end
end
