$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mosaic/foursquare/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mosaic-foursquare"
  s.version     = Mosaic::Foursquare::VERSION
  s.authors     = ["S. Brent Faulkner"]
  s.email       = ["brent.faulkner@mosaic.com"]
  s.homepage    = "http://github.com/mosaicxm/mosaic-foursquare"
  s.summary     = "Mosaic Sales Solutions Foursquare API wrapper."
  s.description = "Wrapper for the Foursquare API with support for the venues API."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "httparty", "~> 0.10.2"

  s.add_development_dependency "sqlite3"
end
