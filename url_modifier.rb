require 'pry'
class UrlModifier
	
	SHORTCUTS = {'socrates' => 'http://socrates.devbootcamp.com/'}
	MODIFIER = {'1' => 'challenges#week-1-ruby'}

	def shortcut(input_url)
		split_args = input_url.split(' ')
		url = base_url(split_args[0])
		modifier = split_args[1].nil? ?  '' : add_modifier(split_args[1])
		url + modifier
	end

	def base_url(arg)
		SHORTCUTS[arg] ? SHORTCUTS[arg] : google_it(arg)
	end

	def add_modifier(arg)
		if MODIFIER[arg]
			MODIFIER[arg]
		else
			' ' + arg
		end
	end


	def google_it(url)
		'http://google.com/search?q=#{url}'
	end

end