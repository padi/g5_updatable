$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "g5_updatable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "g5_updatable"
  s.version     = G5Updatable::VERSION
  s.authors     = ["Brian Bauer"]
  s.email       = ["brian.bauer@getg5.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of G5Updatable."
  s.description = "TODO: Description of G5Updatable."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.2"
  s.add_dependency "microformats2"
  s.add_dependency "virtus"

  s.add_development_dependency "sqlite3"
end
