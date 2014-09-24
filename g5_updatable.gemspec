$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "g5_updatable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "g5_updatable"
  s.version     = G5Updatable::VERSION
  s.authors     = ["Brian Bauer"]
  s.email       = ["brian.bauer@getg5.com"]
  s.homepage    = "https://github.com/G5/g5_updatable"
  s.summary     = "Client/Locations data update engine for G5 applications"
  s.description = "Client/Locations data update engine for G5 applications"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "g5_foundation_client", ">= 0.0.4"
  s.add_dependency "pg"
  s.add_dependency "active_model_serializers", "~> 0.8"

  s.add_development_dependency "rspec-rails", "~> 3.0.0"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "generator_spec"
end
