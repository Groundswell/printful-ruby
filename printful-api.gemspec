$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'stripe/version'

Gem::Specification.new do |s|
  s.name        = 'printful-api'
  s.version     = '1.0.0'
  s.date        = '2017-01-25'
  s.summary     = "A ruby interface to the Prinful api"
  s.description = "Prinful Ruby api bindings"
  s.authors     = ["Michael Ferguson"]
  s.email       = 'meister@spacekace.com'
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ['lib', 'third_party']
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
