require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "sinatra/namespace"

# find current (home) directory and require all files from the models folder
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

# API routes
namespace "/api" do
  get "/songs" do 
    content_type 'application/json'
    @songs = Song.all
    @songs.to_json
  end

  get "/songs/:id" do 
    content_type 'application/json'
    @song = Song.find(params[:id])
    @song.to_json
  end
end

# HTML Routes
get '/' do 
  @songs = Song.all
  erb :index
end

get '/songs/new' do 
  erb :new
end

post '/songs' do
  song = Song.create(
    title: params[:title],
    artist: params[:artist],
    seconds: params[:seconds],
    lyrics: params[:lyrics]
  )
  redirect to("/songs/#{song.id}")
end

get "/songs/:id" do 
  @song = Song.find(params[:id])
  erb :show
end
