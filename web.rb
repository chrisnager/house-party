require 'sinatra'
require 'haml'

get '/' do
	haml :main
end
