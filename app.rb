require 'sinatra'
require 'sinatra/json'
require_relative 'lib/employment'

set :default_company, :github

get '/' do
  redirect to("/#{settings.default_company.to_s}")
end

get '/:company' do
  @company = params[:company]
  haml :index
end

post '/' do
  json :answer => Employment.new(params[:name]).employed_at?(params[:company])
end
