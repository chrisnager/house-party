require 'sinatra'
require 'haml'

get '/' do
	haml :main
end



get '/find-a-party' do
	haml :find_a_party
end



get '/host-a-party' do
	haml :host_a_party
end



get '/party-details' do
	haml :party_details
end