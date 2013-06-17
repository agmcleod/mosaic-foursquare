require 'mosaic/foursquare/checkin'
require 'mosaic/foursquare/photo'
require 'mosaic/foursquare/user'
require 'mosaic/foursquare/venue'
require 'mosaic/foursquare/version'
require 'mosaic/foursquare/tip'
require 'mosaic/foursquare/update'

module Mosaic
  module Foursquare
    @config = {}

    def self.configure(opts = {})
      @config = opts
    end

    def self.config
      @config
    end
  end
end