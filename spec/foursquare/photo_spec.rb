require File.expand_path('../../spec_helper.rb', __FILE__)

describe Mosaic::Foursquare::Photo, :vcr => {:cassette_name => 'Venue/shared'} do
  context "when authenticated" do
    before(:each) do
      Mosaic::Foursquare.configure(:oauth_token => RSpec.configuration.oauth_token)
    end

    context "and I load a group of photos from a venue" do
      let(:photos){Mosaic::Foursquare::Venue.find(RSpec.configuration.venue_id).photos}

      it "should be a list of photos" do
        expect(photos).to be_an_instance_of(Array)
        expect(photos.first).to be_an_instance_of(Mosaic::Foursquare::Photo)
      end

      context "and I load a photo" do
        let(:photo){photos.first}

        it "should produce the original size with no arguments" do
          expect(photo.url).to eql("https://irs2.4sqi.net/img/general/original/photopath.jpg")
        end

        it "should have the author of the photo as the user argument, and load their profile picture" do
          expect(photo.user).to be_an_instance_of(Mosaic::Foursquare::User)
          expect(photo.user.photo).to be_an_instance_of(Mosaic::Foursquare::Photo)
        end

        it "should pass arguments into the url" do
          expect(photo.url("300x500")).to eql("https://irs2.4sqi.net/img/general/300x500/photopath.jpg")
        end
      end
    end
  end
end