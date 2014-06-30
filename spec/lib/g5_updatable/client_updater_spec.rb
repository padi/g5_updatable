require "spec_helper"

describe G5Updatable::ClientUpdater do
  let(:feed_endpoint) { "#{Rails.root}/spec/support/" }
  let(:client_identifier) { "client_feed.html" }
  let(:client_uid) { "#{Rails.root}/spec/support/client_feed.html" }
  let(:g5_client) { G5Updatable::FeedMapper.new(client_identifier).client }
  let(:updater) { described_class.new(g5_client) }

  before do
    allow(G5Updatable).to receive(:feed_endpoint) { feed_endpoint }
    allow(G5Updatable).to receive(:client_identifier) { client_identifier }
  end

  describe "#update" do
    let!(:client) do
      Fabricate(:client, uid: client_uid, name: "Foo", vertical: "Self-Storage")
    end

    context "update client disabled" do
      it "does nothing" do
        expect(client).to_not receive(:save)
        updater.update
      end
    end

    context "update client enabled" do
      before { allow(G5Updatable).to receive(:update_client) { true } }

      context "default parameters" do
        it "updates the name attribute" do
          expect { updater.update }.to change { client.reload.name }.
            from("Foo").to("Farmhouse")
        end

        it "does not update other attributes" do
          expect { updater.update }.not_to change { client.reload.vertical }
        end
      end

      context "custom parameters" do
        before do
          allow(G5Updatable).to receive(:client_parameters) { [:name, :vertical] }
        end

        it "updates the name attribute" do
          expect { updater.update }.to change { client.reload.name }.
            from("Foo").to("Farmhouse")
        end

        it "updates other attributes" do
          expect { updater.update }.to change { client.reload.vertical }.
            from("Self-Storage").to("Apartments")
        end
      end
    end
  end
end
