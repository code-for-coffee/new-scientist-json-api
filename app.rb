require 'bundler'
Bundler.require

get '/' do
  @xml = HTTParty.get('http://feeds.newscientist.com/')
  Crack::XML.parse(@xml).to_json
end
