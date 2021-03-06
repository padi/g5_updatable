FactoryGirl.define do
  factory :location, class: G5Updatable::Location do
    uid "http://example.com/clients/g5-c-1234-client/locations/g5-cl-1234-location"
    urn "g5-cl-1234-location"
    client_uid "http://example.com/clients/g5-c-1234-client"
    properties { { name: "Test Location" } }
  end

  factory :client, class: G5Updatable::Client do
    uid "http://example.com/clients/g5-c-1234-client"
    urn "g5-c-1234-client"
    properties { { name: "Test Client" } }
  end

  factory :integration_setting, class: G5Updatable::IntegrationSetting do
    location_uid "http://example.com/clients/g5-c-12345-client/locations/g5-cl-12345-location"
    uid "http://example.com/clients/g5-c-1234-client/locations/locey/integration_settings/2342"
  end
end
