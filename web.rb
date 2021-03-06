#let Bundler handle all requires
Bundler.require(:default)

#These variables are being read in from .env file or heroku config.
unless ENV["FACEBOOK_APP_ID"] && ENV["FACEBOOK_APP_SECRET"]
	  abort("missing env vars: please set FACEBOOK_APP_ID and FACEBOOK_SECRET with your app credentials")
end

use Rack::Session::Cookie, secret: 'SUPER_SECRET_SWAGTASTIC_HOUSE_PARTY_APP_'

get '/' do
	if session['access_token']
		haml :main
	else
		haml :log_in
	end
end

get '/find-a-party' do
	if session['access_token']
		# @parties = [{ "host": "Alex", "time": "12:15", "location": "Beverly Hills" }, { "host": "David", "time": "17:55", "location": "Memphis" }, { "host": "Potato", "time": "1:44", "location": "Mobile Bay" }, { "host": "Yolo", "time": "1:23", "location": "Mt. Everest" }]
		haml :find_a_party
	else
		haml :log_in
	end
end

get '/host-a-party' do
	if session['access_token']
		haml :host_a_party
	else
		haml :log_in
	end
end

get '/invite-friends' do
	if session['access_token']
		graph = Koala::Facebook::API.new(session['access_token'])
		@friends = graph.get_connections("me", "friends")
		haml :invite_friends, :locals => {:friends => @friends}
	else
		haml :log_in
	end
end

get '/party-details' do
	if session['access_token']
		haml :party_details
	else
		haml :log_in
	end
end

get '/log-in' do
	# generate a new oauth object
 	session['oauth'] = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"], "#{request.base_url}/callback")
	# redirect to facebook
 	redirect session['oauth'].url_for_oauth_code()
 end

get '/logout' do
	session['oauth'] = nil
	session['access_token'] = nil
	redirect '/'
end

#method to handle the redirect from facebook back to us
get '/callback' do
	#get the access token from facebook
	session['access_token'] = session['oauth'].get_access_token(params[:code])
	redirect '/'
end


def self.friends_list(access_token)
	graph = Koala::Facebook::API.new(access_token)
	@friends = graph.get_connections("me", "friends")
end
