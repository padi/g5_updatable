require 'spec_helper'

describe G5Updatable::IntegrationSetting do
  describe 'validations' do
    subject(:integration_setting) { G5Updatable::IntegrationSetting.new }
    it { expect(integration_setting).to validate_presence_of(:location_uid) }
    it { expect(integration_setting).to validate_presence_of(:uid) }
  end

  it_behaves_like 'a model with first-class properties' do
    let(:instance_factory_name) { :integration_setting }
  end

  it_behaves_like 'a model that uses its URN as its parameter' do
    let(:instance_factory_name) { :client }
  end

  describe "#location" do
    let(:integration_setting) { create(:integration_setting, location_uid: location.uid) }
    let(:location) { create(:location) }
    subject { integration_setting.location }

    it { should eq(location) }
  end

  describe :by_vendor_action do
    let!(:inventory) { create(:integration_setting, vendor_action: G5Updatable::IntegrationSetting::INVENTORY) }
    let!(:lead) { create(:integration_setting, vendor_action: G5Updatable::IntegrationSetting::LEAD) }

    it { expect(G5Updatable::IntegrationSetting.by_lead).to eq([lead]) }
    it { expect(G5Updatable::IntegrationSetting.by_inventory).to eq([inventory]) }
  end
end
