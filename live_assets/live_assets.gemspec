$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "live_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "live_assets"
  s.version     = LiveAssets::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LiveAssets."
  s.description = "TODO: Description of LiveAssets."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", "~> 4.0.1.rc4"
  s.add_runtime_dependency "listen", "~> 2.1"
  s.add_runtime_dependency "coffee-rails", "~> 4.0"
  s.add_runtime_dependency "turbolinks", "~> 1.3"

  s.add_development_dependency "puma", "~> 2.6"
  s.add_development_dependency "pry"
  # s.add_development_dependency "sqlite3"
end
