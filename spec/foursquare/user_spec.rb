require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Update, :vcr => {:cassette_name => 'Venue/shared'} do
  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    context "and I load the mayor of a venue" do
      let(:user){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id).mayor}

      it "should load their profile photo" do
        expect(user.photo).to be_an_instance_of(Mosaic::Foursquare::Photo)
        expect(user.photo.url).to eql("https://irs2.4sqi.net/img/user/original/photid.jpg")
      end
    end
  end
end