require 'pry'
require 'uri'
class UrlModifier
	
	SHORTCUTS = {'socrates' => 'http://socrates.devbootcamp.com/',
								'hn' => 'https://news.ycombinator.com/',
								'github' => 'https://github.com/',
								'tumblr' => 'http://www.tumblr.com/dashboard',
								'awesome' => 'http://brogrammersguide.tumblr.com/'}


	MODIFIER = {'1' => 'challenges#week-1-ruby',
							'2' => 'challenges#week-2-oo-design',
							'3' => 'challenges#week-3-databases'}

	def shortcut(input_url)
		split_args = decoder(input_url).chomp.split(' ')
		if SHORTCUTS[split_args[0]]
			url = base_url(split_args[0])
			modifier = split_args[1].nil? ?  '' : add_modifier(split_args[1])
			url + modifier
		else 
			google_it(input_url)
		end
	end

	def decoder(input_url)
		URI.decode(input_url)
	end

	def base_url(arg)
		SHORTCUTS[arg] ? SHORTCUTS[arg] : google_it(arg)
	end

	def add_modifier(arg)
		if MODIFIER[arg]
			MODIFIER[arg]
		else
			''
		end
	end


	def google_it(url)
		URI.escape("https://www.google.com/search?q=#{url}")
	end

end
