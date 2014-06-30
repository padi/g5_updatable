require "spec_helper"

describe G5Updatable::FeedMapper do
  let(:feed_endpoint) { "#{Rails.root}/spec/support/" }

  before { allow(G5Updatable).to receive(:feed_endpoint) { feed_endpoint } }

  describe "#client" do
    subject(:client_mapper) { described_class.new(client_identifier).client }

    context "a nil identifier" do
      let(:client_identifier) { nil }

      before { allow(G5Updatable).to receive(:client_identifier) { nil } }

      it "does nothing" do
        expect(client_mapper).to be_nil
      end
    end

    context "a given identifier" do
      let(:client_identifier) { "client_feed.html" }

      it "maps to the correct name" do
        expect(client_mapper.name).to eq("Farmhouse")
      end

      it "maps to the correct vertical" do
        expect(client_mapper.vertical).to eq("Apartments")
      end

      it "maps to the correct domain" do
        expect(client_mapper.domain).to eq("http://farmhouseapartments.com/")
      end

      it "maps to the correct type" do
        expect(client_mapper.type).to eq("MultiDomainClient")
      end
    end
  end

  describe "#locations" do
    subject(:location_mapper) { described_class.new(client_identifier).locations.first }

    context "a nil identifier" do
      let(:client_identifier) { nil }

      before { allow(G5Updatable).to receive(:client_identifier) { nil } }

      it "does nothing" do
        expect(location_mapper).to be_nil
      end
    end

    context "a given identifier" do
      let(:client_identifier) { "client_feed.html" }

      it "maps to the correct urn" do
        expect(location_mapper.urn).to eq("g5-cl-1qrcyt46-hollywood")
      end

      it "maps to the correct name" do
        expect(location_mapper.name).to eq("Hollywood")
      end

      it "maps to the correct domain" do
        expect(location_mapper.domain).to eq("http://www.hollywood.com/")
      end

      it "maps to the correct street_address" do
        expect(location_mapper.street_address).to eq("4567 Storage Drive Unit 5")
      end

      it "maps to the correct state" do
        expect(location_mapper.state).to eq("CA")
      end

      it "maps to the correct city" do
        expect(location_mapper.city).to eq("Hollywood")
      end

      it "maps to the correct neighborhood" do
        expect(location_mapper.neighborhood).to eq("Westwood")
      end

      it "maps to the correct postal_code" do
        expect(location_mapper.postal_code).to eq("80229")
      end

      it "maps to the correct phone_number" do
        expect(location_mapper.phone_number).to eq("555-555-5555")
      end

      it "maps to the correct corporate" do
        expect(location_mapper.corporate).to eq("False")
      end

      it "maps to the correct floor_plans" do
        expect(location_mapper.floor_plans).to eq("2 Bedroom 2 Bath, Studio")
      end

      it "maps to the correct primary_amenity" do
        expect(location_mapper.primary_amenity).to eq("Secret Passages")
      end

      it "maps to the correct qualifier" do
        expect(location_mapper.qualifier).to eq("Luxury")
      end

      it "maps to the correct primary_landmark" do
        expect(location_mapper.primary_landmark).to eq("Seattle Grace Hospital")
      end
    end
  end
end
