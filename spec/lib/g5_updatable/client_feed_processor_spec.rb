require "spec_helper"

describe G5Updatable::ClientFeedProcessor do
  describe ".new" do
    let(:processor) { described_class.new(passed_uid) }
    subject(:client_uid) { processor.client_uid }
    let(:configured_client_uid) { nil }

    context "when CLIENT_UID is unset" do
      context "with a passed-in client_uid" do
        let(:passed_uid) { "passed" }
        it { should eq("passed") }
      end

      context "with no passed-in client_uid" do
        let(:passed_uid) { nil }

        it "explodes helpfully" do
          expect { client_uid }.to raise_error(/client_uid/)
        end
      end
    end

    context "when CLIENT_UID is set" do
      before do
        @old_client_uid = ENV["CLIENT_UID"]
        ENV["CLIENT_UID"] = "configured"
      end
      after { ENV["CLIENT_UID"] = @old_client_uid }

      context "with a passed-in client_uid" do
        let(:passed_uid) { "passed" }
        it { should eq("passed") }
      end

      context "with no passed-in client_uid" do
        let(:passed_uid) { nil }
        it { should eq("configured") }
      end
    end
  end

  describe "#work" do
    let(:client_updater) { double(update: nil) }
    let(:locations_updater) { double(update: nil) }

    let(:client) { FactoryGirl.build(:g5_client) }
    let(:client_uid) { "http://example.com/cilent_uid" }

    before do
      stub_client_for_uid(client_uid, client)
      allow(G5Updatable::ClientUpdater).to receive(:new) { client_updater }
      allow(G5Updatable::LocationsUpdater).to receive(:new) { locations_updater }
      G5Updatable::ClientFeedProcessor.new(client_uid).work
    end

    it "updates with the found client" do
      expect(G5Updatable::ClientUpdater).to have_received(:new).with(client)
      expect(client_updater).to have_received(:update)
    end

    it "updates with the client's associated locations" do
      expect(G5Updatable::LocationsUpdater).to have_received(:new).with(client.locations)
      expect(locations_updater).to have_received(:update)
    end
  end
end
