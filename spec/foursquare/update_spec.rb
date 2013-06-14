require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Update, :vcr => {:cassette_name => 'Venue/shared'} do
  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    context "and I load a group of updates from a venue" do
      let(:updates){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id).updates}

      it "should be a list of updates" do
        expect(updates).to be_an_instance_of(Array)
        expect(updates.first).to be_an_instance_of(Mosaic::Foursquare::Update)
      end

      context "and I load a update" do
        let(:update){updates.first}

        it "should load any photos attached" do
          expect(update.photos).to be_an_instance_of(Array)
          expect(update.photos.first).to be_an_instance_of(Mosaic::Foursquare::Photo)
        end

        it "should load the text" do
          expect(update.shout).to eql("Welcome to Test Venue")
        end
      end
    end
  end
end