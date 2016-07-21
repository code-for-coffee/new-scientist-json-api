require 'bundler'
Bundler.require


## helpers
def xml_feed_to_json(url)
  @xml = HTTParty.get(url)
  Crack::XML.parse(@xml).to_json
end

## root

get '/' do
  { :message => "Unofficial New Scientist API; see https://github.com/code-for-coffee/new-scientist-json-api/ for documentation",
    :auth_resource => "/register/your_name" }.to_json
end

## api key auth
get '/register/:username' do
  if !params[:username]
    status 400
    { :message => "no username parameter specified" }.to_json
  else
    @registered_user = User.new(params[:username])
    @registered_user.to_json
  end
end

## api
get '/api/v1' do
  xml_feed_to_json('http://feeds.newscientist.com/')
end

get '/api/v1/news' do
  xml_feed_to_json('http://feeds.newscientist.com/science-news')
end

get '/api/v1/features' do
  xml_feed_to_json('http://feeds.newscientist.com/features')
end

get '/api/v1/math-pyshics' do
  xml_feed_to_json('http://feeds.newscientist.com/physics-math')
end

get '/api/v1/tech' do
  xml_feed_to_json('http://feeds.newscientist.com/tech')
end

get '/api/v1/space' do
  xml_feed_to_json('http://feeds.newscientist.com/space')
end

get '/api/v1/life' do
  xml_feed_to_json('http://feeds.newscientist.com/life')
end

get '/api/v1/environment' do
  xml_feed_to_json('http://feeds.newscientist.com/environment')
end

get '/api/v1/health' do
  xml_feed_to_json('http://feeds.newscientist.com/health')
end

get '/api/v1/humans' do
  xml_feed_to_json('http://feeds.newscientist.com/humans')
end
