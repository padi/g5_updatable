require "spec_helper"

describe G5Updatable::IntegrationSettingsUpdater do
  let(:uid) { "http://example.com/uid" }
  let(:name) { "integration setting name" }
  let(:properties) { {uid:           uid,
                      urn:           "urn",
                      vendor_action: "inventory",
                      location_uid:  "location_uid",
                      job_frequency_in_minutes: 22,
                      name:          name} }
  let(:integration_setting) { G5FoundationClient::IntegrationSetting.new(properties) }

  let(:updater) { described_class.new([integration_setting]) }

  describe "#update" do
    subject { G5Updatable::IntegrationSetting.first }

    context "with no existing integration-setting records" do
      before { updater.update }

      it "creates a Location" do
        expect(G5Updatable::IntegrationSetting.count).to eq(1)
      end

      its(:job_frequency_in_minutes) { should eq(22) }
      its(:uid) { should eq(uid) }
      its(:urn) { should eq("urn") }
      its(:location_uid) { should eq("location_uid") }
      its(:name) { should eq(name) }
      its(:vendor_action) { should eq("inventory") }
    end

    context "with an existing integration-setting record" do
      before do
        create(:integration_setting, uid: uid, urn: "old")
        updater.update
      end

      it "does not create a new IntegrationSetting" do
        expect(G5Updatable::IntegrationSetting.count).to eq(1)
      end

      its(:urn) { should eq("urn") }
      its(:name) { should eq(name) }
    end
  end
end
