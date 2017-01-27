$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

puts 'gemspec'

require 'printful_api/version'

Gem::Specification.new do |s|
  s.name        	= 'printful_api'
  s.version     	= PrintfulAPI::VERSION
  s.date        	= '2017-01-25'
  s.summary     	= "A ruby interface to the Prinful api"
  s.description 	= "Prinful Ruby api bindings"
  s.authors     	= ["Michael Ferguson"]
  s.email       	= 'meister@spacekace.com'
  s.files 			= `git ls-files`.split("\n")
  s.require_paths 	= ['lib']
  # s.homepage    =	'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
end
