require 'sinatra'

set :default_company, :github

get '/' do
  redirect to("/#{settings.default_company.to_s}")
end

get '/:company' do
  @company = params[:company]
  haml :index
end

post '/' do
  params[:company]
end
