require "spec_helper"

describe G5Updatable::ClientFeedProcessor do
  let(:client_updater) { double(update: nil) }
  let(:locations_updater) { double(update: nil) }

  before do
    allow(G5Updatable::ClientUpdater).to receive(:new) { client_updater }
    allow(G5Updatable::LocationsUpdater).to receive(:new) { locations_updater }
  end

  describe "#work" do
    after { described_class.work }

    context "a configured client uid" do
      before { allow(G5Updatable).to receive(:client_uid) { "http://foo.com" } }

      it "calls update on the client updater" do
        expect(client_updater).to receive(:update)
      end

      it "calls update on the locations updater" do
        expect(locations_updater).to receive(:update)
      end
    end

    context "no configured client uid" do
      before { allow(G5Updatable).to receive(:client_uid) { nil } }

      it "does not call update on the client updater" do
        expect(client_updater).to_not receive(:update)
      end

      it "does not call update on the locations updater" do
        expect(locations_updater).to_not receive(:update)
      end
    end
  end
end
