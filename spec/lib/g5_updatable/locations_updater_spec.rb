require "spec_helper"

describe G5Updatable::LocationsUpdater do
  let(:uid) { "http://example.com/uid" }
  let(:g5_location) do
    FactoryGirl.build(
      :g5_location,
      uid: uid,
      urn: "urn",
      client_uid: "client_uid",
      name: "Location Name"
    )
  end
  let(:updater) { described_class.new([ g5_location ]) }

  describe "#update" do
    subject { G5Updatable::Location.first }

    context "with no existing Location records" do
      before { updater.update }

      it "creates a Location" do
        expect(G5Updatable::Location.count).to eq(1)
      end

      its(:uid) { should eq(uid) }
      its(:urn) { should eq("urn") }
      its(:client_uid) { should eq("client_uid") }
      its(:name) { should eq("Location Name") }
    end

    context "with an existing Location record" do
      before do
        FactoryGirl.create(:location, uid: uid, urn: "old")
        updater.update
      end

      it "does not create a new Location" do
        expect(G5Updatable::Location.count).to eq(1)
      end

      its(:urn) { should eq("urn") }
      its(:name) { should eq("Location Name") }
    end
  end
end
