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

  s.files =`git ls-files`.split($/)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency "faraday", "~> 0.8.7"
  s.add_dependency "faraday_middleware", "~> 0.9.0"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end
