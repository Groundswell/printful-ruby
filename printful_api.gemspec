$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'printful_api/version'

Gem::Specification.new do |s|
  s.name        	= 'printful_api'
  s.version     	= PrintfulAPI::VERSION
  s.date        	= '2017-01-25'
  s.summary     	= "Ruby bindings for the Printful API"
  s.description 	= "Printful is the easiest way to sell, print and ship custom posters, shirts, mugs, pillows, leggings, totes ..."
  s.authors     	= ["Michael Ferguson"]
  s.email       	= 'meister@spacekace.com'
  s.files 			= `git ls-files`.split("\n")
  s.require_paths 	= ['lib']
  s.homepage    =	'http://rubygems.org/gems/printful_api'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
end
