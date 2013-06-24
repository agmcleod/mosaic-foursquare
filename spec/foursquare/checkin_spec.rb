require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Checkin, :vcr => {:cassette_name => 'Venue/shared'} do
  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    context "and I find a checkin" do
      let(:checkin) { Mosaic::Foursquare::Checkin.find(RSpec.configuration.checkin_id, { :signature => RSpec.configuration.checkin_signature  }) }
      it "should create a new checkin" do
        expect(checkin).to be_an_instance_of(Mosaic::Foursquare::Checkin)
      end

      it "should create a new user based on checkin's author" do
        expect(checkin.user).to be_an_instance_of(Mosaic::Foursquare::User)
      end

      it "should create a new venue based on the checkin's venue" do
        expect(checkin.venue).to be_an_instance_of(Mosaic::Foursquare::Venue)
      end
    end

    context "and I load a group of checkins from a venue" do
      let(:checkins){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id).herenow}

      it "should be a list of checkins" do
        expect(checkins).to be_an_instance_of(Array)
        expect(checkins.first).to be_an_instance_of(Mosaic::Foursquare::Checkin)
      end

      context "and I load a checkin" do
        let(:checkin){checkins.first}

        it "should load the author of a checkin" do
          expect(checkin.user).to be_an_instance_of(Mosaic::Foursquare::User)
        end

      end
    end
  end
end