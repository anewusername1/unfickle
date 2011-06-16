# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'unfickle/version'

Gem::Specification.new do |s|
  s.name        = 'unfickle'
  s.version     = Unfickle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tracey Eubanks']
  s.email       = ['tracey.eubanks@moneydesktop.com', 'traceyeubanks@yahoo.com']
  s.summary     = 'Help clean up code by using unfickle for constant declaration'
  s.description = 'Help clean up code by using unfickle for constant declaration'

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency 'bundler', '~> 1.0.0'
  s.add_development_dependency 'rspec', '~> 2.0.0'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end

