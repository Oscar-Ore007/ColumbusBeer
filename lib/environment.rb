require "./lib/ColumbusBeer/version"
require_relative "ColumbusBeer/cli"
require_relative "ColumbusBeer/api"
require_relative "ColumbusBeer/beers"

require 'pry'
require 'httparty'
require 'colorize'


module ColumbusBeer
  class Error < StandardError; end
  # Your code goes here...
end
