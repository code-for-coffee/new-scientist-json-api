require 'dotenv'
Dotenv.load

require './app'
require './models/User'
require './models/Log'

run Sinatra::Application
