$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nuke_pave/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nuke_pave"
  s.version     = NukePave::VERSION
  s.authors     = ["David Bock"]
  s.email       = ["dbock@codesherpas.com"]
  s.homepage    = "http://www.codesherpas.com"
  s.summary     = "Nukes and paves your database."
  s.description = "Nukes and paves your database."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2"
end
