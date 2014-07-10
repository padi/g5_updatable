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
end
