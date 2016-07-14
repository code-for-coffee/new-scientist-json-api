require 'bundler'
Bundler.require



def xml_feed_to_json(url)
  @xml = HTTParty.get(url)
  Crack::XML.parse(@xml).to_json
end

get '/' do
  xml_feed_to_json('http://feeds.newscientist.com/')
end

get '/news' do
  xml_feed_to_json('http://feeds.newscientist.com/science-news')
end

get '/features' do
  xml_feed_to_json('http://feeds.newscientist.com/features')
end

get '/math-pyshics' do
  xml_feed_to_json('http://feeds.newscientist.com/physics-math')
end

get '/tech' do
  xml_feed_to_json('http://feeds.newscientist.com/tech')
end

get '/space' do
  xml_feed_to_json('http://feeds.newscientist.com/space')
end

get '/life' do
  xml_feed_to_json('http://feeds.newscientist.com/life')
end

get '/environment' do
  xml_feed_to_json('http://feeds.newscientist.com/environment')
end

get '/health' do
  xml_feed_to_json('http://feeds.newscientist.com/health')
end

get '/humans' do
  xml_feed_to_json('http://feeds.newscientist.com/humans')
end
