require './app'

# use coffeescript for javascript
require 'rack/coffee'
use Rack::Coffee, root: 'public', urls: '/javascripts'

run Sinatra::Application
