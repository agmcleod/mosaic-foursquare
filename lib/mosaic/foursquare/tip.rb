require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Tip < Mosaic::Foursquare::Object
      attr_accessor :created_at, :id, :text, :venue, :user
      class << self
        def find(id, options = {})
          response = query("tips/#{id}", options)
          self.new response['response']['tip']
        end
      end

      def initialize(attributes = {})
        super
        self.user &&= Mosaic::Foursquare::User.new(self.user)
        self.venue &&= Mosaic::Foursquare::Venue.new(self.venue)
      end
    end
  end
end
