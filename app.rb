require_relative 'config/environment'
require 'pry'

class Application < Sinatra::Base
  
  get '/' do
    @game = TicTacToe.new
    erb :index
  end
  
  post '/' do
    @game = TicTacToe.new
    @game.turns(params)
    erb :index
  end
  
end
