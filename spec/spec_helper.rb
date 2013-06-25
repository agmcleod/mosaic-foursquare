# $:.push File.expand_path("../lib", __FILE__)
# require 'lib/mosaic_facebook'

require 'rubygems'
require 'bundler/setup'
require 'vcr'
Bundler.require(:default)

SPEC_DIR = File.dirname(__FILE__)
# lib_path = File.expand_path("#{SPEC_DIR}/../lib")
# $LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)
require "#{SPEC_DIR}/vcr/vcr"

require 'mosaic-foursquare'
FOURSQUARE_CONFIG = YAML.load(File.open("#{SPEC_DIR}/foursquare_config.yml", 'r'))

RSpec.configure do |config|
  config.add_setting :oauth_token, :default => FOURSQUARE_CONFIG["oauth_token"]
  config.add_setting :venue_id, :default => FOURSQUARE_CONFIG["venue_id"]
  config.add_setting :tip_id, :default => FOURSQUARE_CONFIG["tip_id"]
  config.add_setting :checkin_id, :default => FOURSQUARE_CONFIG["checkin_id"]
  config.add_setting :checkin_signature, :default => FOURSQUARE_CONFIG["checkin_signature"]
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
