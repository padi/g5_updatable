require "spec_helper"

describe G5Updatable::LocationsUpdater do
  let(:feed_endpoint) { "#{Rails.root}/spec/support/" }
  let(:client_identifier) { "updated_client_feed.html" }
  let(:locations) { G5Updatable::FeedMapper.new(client_identifier).locations }
  let(:g5_location) { locations.first }
  let(:urn) { g5_location.uid.to_s.split("/").last }
  let(:updater) { described_class.new(locations) }

  before do
    allow(G5Updatable).to receive(:feed_endpoint) { feed_endpoint }
    allow(G5Updatable).to receive(:client_identifier) { client_identifier }
  end

  describe "#update" do
    let!(:location) do
      Fabricate(:location, urn: urn, name: "Foo", neighborhood: "Eastside")
    end

    context "update locations disabled" do
      before { allow(G5Updatable).to receive(:update_locations) { false } }

      it "does not update existing locations" do
        expect(locations).to_not receive(:save)
        updater.update
      end

      it "creates new locations" do
        expect { updater.update }.to change { Location.all.size }.from(1).to(2)
      end
    end

    context "update locations enabled" do
      context "default parameters" do
        it "updates the name attribute" do
          expect { updater.update }.to change { location.reload.name }.
            from("Foo").to("Hollywood")
        end

        it "does not update other attributes" do
          expect { updater.update }.not_to change { location.reload.neighborhood }
        end

        it "creates new locations" do
          expect { updater.update }.to change { Location.all.size }.from(1).to(2)
        end
      end

      context "custom parameters" do
        before do
          allow(G5Updatable).to receive(:location_parameters) { [:name, :neighborhood] }
        end

        it "updates the name attribute" do
          expect { updater.update }.to change { location.reload.name }.
            from("Foo").to("Hollywood")
        end

        it "updates other attributes" do
          expect { updater.update }.to change { location.reload.neighborhood }.
            from("Eastside").to("River West")
        end

        it "creates new locations" do
          expect { updater.update }.to change { Location.all.size }.from(1).to(2)
        end
      end
    end
  end
end
