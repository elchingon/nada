require 'dotenv'

Dotenv.load

require 'rspec'
require 'rest-client'
require 'nada'

Dir[File.dirname(__FILE__) + "/support/**.rb"].each{|support_file| require support_file }
