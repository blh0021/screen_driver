# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'screen_driver'
  s.version     = '0.0.1'
  s.date        = '2014-07-17'
  s.summary     = "Screen Driver Gem"
  s.description = "This gem allows you to search the screen for specific images and perform Key or Mouse events."
  s.authors     = ["Ben Harrington"]
  s.email       = 'ben@harringtonweb.com'
  s.files       = `git ls-files`.split("\n") 
  s.homepage    = ''
  s.license     = ''
  s.require_paths = ["lib", "target"]
end
