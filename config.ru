require 'dotenv'
Dotenv.load

require './app'
require './models/User'

run Sinatra::Application
