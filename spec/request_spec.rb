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
    context 'with a Github username' do
      before { FakeGithub.stub_org_members('github', ['holman']) }
      it 'provides an answer' do
        post '/', { :company => 'github', :name => 'holman' }
        last_response.should be_ok
        JSON.parse(last_response.body).should be_true
      end
    end
  end
end

