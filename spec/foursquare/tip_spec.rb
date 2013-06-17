require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Tip, :vcr => {:cassette_name => 'Venue/shared'} do
  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    context "and I load a tip" do
      let(:tip){Mosaic::Foursquare::Tip.find(RSpec.configuration.tip_id)}

      it "should be a tip" do
        expect(tip).to be_an_instance_of(Mosaic::Foursquare::Tip)
      end

      it "should assign a venue" do
        expect(tip.venue).to be_an_instance_of(Mosaic::Foursquare::Venue)
      end

      it "should assign a user" do
        expect(tip.user).to be_an_instance_of(Mosaic::Foursquare::User)
      end

      it "should set text" do
        expect(tip.text).to eql("Get two slices and a can of soda for only $2.75!")
      end
    end

    context "and I load a list of tips from a venue" do
      let(:tips){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id).tips}
      it "should load tips" do
        expect(tips).to be_an_instance_of(Array)
        expect(tips.first).to be_an_instance_of(Mosaic::Foursquare::Tip)
      end
    end
  end
end