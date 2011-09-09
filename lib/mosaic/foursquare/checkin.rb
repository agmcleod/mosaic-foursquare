require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Checkin < Mosaic::Foursquare::Object
      attr_reader :created_at, :id, :shout, :user

      def initialize(attributes = {})
        super
        @user &&= Mosaic::Foursquare::User.new(@user)
      end
    end
  end
end
