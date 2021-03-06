$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "responders/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "responders"
  s.version     = Responders::VERSION
  s.authors     = ["Jose Valim"]
  s.email       = ["idk@gmail.com"]
  s.homepage    = "http://pragprog.com/book/jvrails2/crafting-rails-4-applications"
  s.summary     = "Crafting Rails 4 Apps"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "pry"
end
