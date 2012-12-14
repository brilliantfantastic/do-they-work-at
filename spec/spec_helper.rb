require 'rspec'
require 'rack/test'
require 'webmock/rspec'

require_relative '../app'
require_relative 'fake_github'
require_relative '../lib/employment.rb'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
