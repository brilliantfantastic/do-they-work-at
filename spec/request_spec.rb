require 'spec_helper'

set :environment, :test

describe 'app' do
  def app
    Sinatra::Application
  end

  it 'redirects to a default company' do
    set :default_company, :bf
    get '/'
    last_response.should be_redirect
    follow_redirect!
    last_request.url.should == 'http://example.org/bf'
  end
end

