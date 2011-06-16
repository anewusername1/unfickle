require 'rubygems'
require 'bundler'
Bundler.setup :default, :test

RSpec.configure do |c|
  c.mock_with :rspec
end

require 'fileutils'

# Fix the loadpath for specs
$:.push File.expand_path('../lib', File.dirname(__FILE__))
$:.push File.expand_path('../spec', File.dirname(__FILE__))

require 'unfickle'


Dir[File.expand_path("spec/support/**/*.rb")].each {|f| require f}
