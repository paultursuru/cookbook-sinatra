require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'
require_relative 'recipe'

set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# get '/' do
#   erb :index
# end
cookbook = Cookbook.new('recipes.csv')

get '/about' do
  erb :about
end

get '/' do
  @cookbook = cookbook
  erb :index
end

get '/new' do
  @cookbook = cookbook
  @recipe = recipe
  erb :new
end
