require 'spec_helper'

describe G5Updatable::Client do
  describe "validations" do
    subject(:client) { G5Updatable::Client.new }

    it { expect(client).to validate_presence_of(:uid) }
    it { expect(client).to validate_presence_of(:urn) }
  end

  it_behaves_like "a model with first-class properties" do
    let(:instance_factory_name) { :client }
  end

  it_behaves_like "a model that uses its URN as its parameter" do
    let(:instance_factory_name) { :client }
  end

  describe :locations do
    let!(:location) { create(:location, client_uid: subject.uid) }
    subject { create(:client) }

    its(:locations) { is_expected.to eq([location]) }
  end
end
