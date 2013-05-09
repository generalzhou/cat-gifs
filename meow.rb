#author: jack zhou
#Ruby version of bunny1 by ccheever #https://github.com/ccheever/bunny1

require 'sinatra'
require_relative 'url_modifier'

urlizer = UrlModifier.new

get '/' do
	"Welcome to CAT GIFS, search shortcut tool<br>" +\
	"This is based on bunny1 by Charlie Cheever when he was at Facebook<br>" +\
	'<a href = "https://github.com/generalzhou/cat-gifs">Fork me on Github!</a><br>' +\
	"<a href=\"javascript:window.external.AddSearchProvider\(\'http:\/\/cat-gifs.heroku.com\/install'\);\">click here to install<\/a>"
end


get '/hello/:name' do
	"Hello #{params[:name]}"
end

get '/meow/:url' do
  url = urlizer.shortcut(params[:url])
  redirect to(url)
end

get '/install' do
	redirect('public/search_install.xml')
end


get '/files/:path' do 
	"#{params[:path]}"
	File.open(params[:path]).each_line do |line| line end
end
