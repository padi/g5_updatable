require 'spec_helper'

describe G5Updatable::Location do
  describe "validations" do
    subject(:location) { G5Updatable::Location.new }

    it { expect(location).to validate_presence_of(:uid) }
    it { expect(location).to validate_presence_of(:urn) }
    it { expect(location).to validate_presence_of(:client_uid) }
  end

  it_behaves_like "a model with first-class properties" do
    let(:instance_factory_name) { :location }
  end
end
