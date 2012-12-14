require 'spec_helper'

set :environment, :test

describe 'app' do
  def app
    Sinatra::Application
  end

  it 'redirects to a default company' do
    app.default_company = :bf
    get '/'
    last_response.should be_redirect
  end
end

