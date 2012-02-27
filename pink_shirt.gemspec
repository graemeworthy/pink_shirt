# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pink_shirt/version"

Gem::Specification.new do |s|
  s.name        = "pink_shirt"
  s.version     = PinkShirt::VERSION
  s.authors     = ["Graeme Worthy"]
  s.email       = ["graemeworthy@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An Html to Textile Converter}
  s.description = %q{Converts Html to Textile, or as some say 'html2textile, it's built on nokogiri''}

  s.rubyforge_project = "pink_shirt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


   s.add_development_dependency "RedCloth"
   s.add_development_dependency "rspec"   
   s.add_runtime_dependency "nokogiri"
end
