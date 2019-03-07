require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

desc "Sinatra needs to sing"
namespace :loud do
  task :sing do 
    system "say 'And more, much more than this, I did it my way'"
    puts "Sinatra needs a drink and will be back later..."
  end
end

desc "Open a interactive console for this app"
task :console do 
  system "irb -r ./app.rb"
end