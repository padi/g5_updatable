class G5Updatable::ClientFeedProcessor
  attr_reader :client_uid

  def initialize(client_uid=nil)
    @client_uid = client_uid || ENV["CLIENT_UID"]
    raise "A client_uid must be either passed in or configured!" if @client_uid.blank?
  end

  def work
    client = G5FoundationClient::Client.find_by_uid(@client_uid)
    G5Updatable::ClientUpdater.new(client).update
    G5Updatable::LocationsUpdater.new(client.locations).update
    client.locations.each do |location|
      G5Updatable::IntegrationSettingsUpdater.new(location.integration_settings).update
    end
  end
end
