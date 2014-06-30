require "spec_helper"

describe G5Updatable::LocationsUpdater do
  let(:client_uid) { "#{Rails.root}/spec/support/updated_client_feed.html" }
  let(:locations) { G5Updatable::FeedMapper.new.locations }
  let(:g5_location) { locations.first }
  let(:updater) { described_class.new(locations) }

  before { allow(G5Updatable).to receive(:client_uid) { client_uid } }
  after { Location.destroy_all }

  describe "#update" do
    let!(:location) do
      Fabricate(:location, uid: g5_location.uid, name: "Foo", neighborhood: "Eastside")
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
