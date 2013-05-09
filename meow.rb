#author: jack zhou
#Ruby version of bunny1 by ccheever #https://github.com/ccheever/bunny1

require "execjs"
require 'sinatra'
require './url_modifier'

urlizer = UrlModifier.new

get '/' do
	"Welcome to meowlol, search shortcut tool\n"
	"This is based on bunny1 by Charlie Cheever when he was at Facebook\n"
	'<a href = "https://github.com/generalzhou/meowlol">Fork me on Github!</a>'
	"<a href=\"javascript:window.external.AddSearchProvider\(\'http:\/\/meowlol.heroku.com\/install'\);\">click here to install<\/a>"
end



get '/hello/:name' do
	"Hello #{params[:name]}"
end

get '/meow/:url' do
  url = urlizer.shortcut(params[:url])
  # binding.pry
  # ExecJS.eval "localStorage.setItem('unit-menu-last', '');"
  # puts "Stored value = " + ExecJS.eval("alert(localStorage.getItem(\'unit-menu-last\'));")
  # puts "WE ARE GOING TO THIS URL: #{url}"
  redirect to(url)

  # redirect('/hello/jack')

end

get '/install' do
	redirect('public/search_install.xml')
end


get '/files/:path' do 
	"#{params[:path]}"
	File.open(params[:path]).each_line do |line| line end
end
