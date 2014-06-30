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

    it "calls update on the client updater" do
      expect(client_updater).to receive(:update)
    end

    it "calls update on the locations updater" do
      expect(locations_updater).to receive(:update)
    end
  end
end
