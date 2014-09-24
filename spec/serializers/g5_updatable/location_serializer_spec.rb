require 'spec_helper'

describe G5Updatable::LocationSerializer do
  let(:location) do
    FactoryGirl.build(
      :location,
      uid: "https://example.com/locations/test-urn",
      urn: "test-urn",
      client_uid: "https://example.com/client",
      properties: {
        name: "Test Name"
      }
    )
  end
  subject { G5Updatable::LocationSerializer.new(location).as_json["location"] }

  its([:uid]) { is_expected.to eq("https://example.com/locations/test-urn") }
  its([:urn]) { is_expected.to eq("test-urn") }
  its([:client_uid]) { is_expected.to eq("https://example.com/client") }
  its([:name]) { is_expected.to eq("Test Name") }
end
