require "spec_helper"

describe G5Updatable::ClientUpdater do
  let(:uid) { "http://example.com/uid" }
  let(:properties) { {uid:  uid,
                      urn:  "urn",
                      name: "Client Name", } }
  let(:g5_client) { G5FoundationClient::Client.new(properties) }

  let(:updater) { described_class.new(g5_client) }

  describe "#update" do
    subject { G5Updatable::Client.first }

    context "with no existing Client records" do
      before { updater.update }

      it "creates a Client" do
        expect(G5Updatable::Client.count).to eq(1)
      end

      it 'does not redact keys in properties' do
        expect(subject.properties.keys.collect(&:to_sym)).to eq(properties.keys)
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
