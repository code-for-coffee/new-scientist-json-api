require 'bundler'
Bundler.require


## helpers
def xml_feed_to_json(url)
  @xml = HTTParty.get(url)
  Crack::XML.parse(@xml).to_json
end

def log_access(api_key, resource, ip, host)
  @log = Log.new(api_key, resource, ip, host)
  if @log.is_api_key_valid == true
    @log.save
    true
  else
    false
  end
end

## root

get '/' do
  { :message => "Unofficial New Scientist API; see https://github.com/code-for-coffee/new-scientist-json-api/ for documentation",
    :auth_resource => "/register/your_name" }.to_json
end

## api key auth
get '/register/:username' do
  @registered_user = User.new(params[:username], request.ip, request.host)
  @registered_user.save
  @registered_user.to_json
end

## api
get '/api/v1' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/news' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/science-news')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/features' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/features')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/math-pyshics' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/physics-math')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/tech' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/tech')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/space' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/space')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/life' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/life')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/environment' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/environment')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/health' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/health')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end

get '/api/v1/humans' do
  is_authorized = log_access(params[:api_key], request.path, request.ip, request.host)
  if is_authorized == true
      xml_feed_to_json('http://feeds.newscientist.com/humans')
  else
    { :message => 'Invalid API key.' }.to_json
  end
end
