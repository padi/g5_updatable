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
end
