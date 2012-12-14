require 'spec_helper'

set :environment, :test

describe 'app' do
  def app
    Sinatra::Application
  end

  describe 'get /' do
    it 'redirects to a default company' do
      set :default_company, :bf
      get '/'
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should == 'http://example.org/bf'
    end
  end

  describe 'post /' do
    it 'provides an answer' do
      post '/', { :company => 'github', :name => 'Zack Holman' }
      last_response.should be_ok
    end
  end
end

