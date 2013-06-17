require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Venue, :vcr => {:cassette_name => 'Venue/shared'} do

  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    it "should be able to load a venue" do
      venue = Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id)
      expect(venue).to be_an_instance_of(Mosaic::Foursquare::Venue)
    end

    context "with a venue" do
      let(:venue){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id)}

      it "should associate the mayor correctly" do
        expect(venue.mayor).to be_an_instance_of(Mosaic::Foursquare::User)
      end

      it "should assign a location" do
        expect(venue.location).to be_an_instance_of(Mosaic::Foursquare::Venue::Location)
      end

      it "should assign the updates correctly" do
        expect(venue.updates).to be_an_instance_of(Array)
        expect(venue.updates.first).to be_an_instance_of(Mosaic::Foursquare::Update)
      end

      it "should create a statistics object" do
        expect(venue.stats).to be_an_instance_of(Mosaic::Foursquare::Venue::Stats)
      end

      it "should assign the checkins count" do
        expect(venue.stats.checkins_count).to eql(468)
      end

      it "should assign the users count" do
        expect(venue.stats.users_count).to eql(58)
      end

      it "should assign the tip count " do
        expect(venue.stats.tip_count).to eql(0)
      end

      it "should assign the photos count" do
        expect(venue.stats.photos_count).to eql(16)
      end

      it "should assign the update count" do
        expect(venue.stats.updates_count).to eql(1)
      end
    end
  end


end