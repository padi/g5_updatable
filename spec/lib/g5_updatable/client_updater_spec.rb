require "spec_helper"

describe G5Updatable::ClientUpdater do
  let(:uid) { "http://example.com/uid" }
  let(:g5_client) do
    FactoryGirl.build(
      :g5_client,
      uid: uid,
      urn: "urn",
      name: "Client Name"
    )
  end
  let(:updater) { described_class.new(g5_client) }

  describe "#update" do
    subject { G5Updatable::Client.first }

    context "with no existing Client records" do
      before { updater.update }

      it "creates a Client" do
        expect(G5Updatable::Client.count).to eq(1)
      end

      its(:uid) { should eq(uid) }
      its(:urn) { should eq("urn") }
      its(:name) { should eq("Client Name") }
    end

    context "with an existing Client record" do
      before do
        FactoryGirl.create(:client, uid: uid, urn: "old")
        updater.update
      end

      it "does not create a new Client" do
        expect(G5Updatable::Client.count).to eq(1)
      end

      its(:urn) { should eq("urn") }
      its(:name) { should eq("Client Name") }
    end
  end
end
