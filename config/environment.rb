ENV['SINATRA_ENV'] ||= "development"
ENV['RAKE_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require './app'
require './models/tic_tac_toe.rb'