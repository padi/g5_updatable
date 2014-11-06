class G5Updatable::ClientFeedProcessor
  attr_reader :client_uid

  def initialize(client_uid=nil)
    @client_uid = client_uid || ENV["CLIENT_UID"]
    raise "A client_uid must be either passed in or configured!" if @client_uid.blank?
  end

  class << self
    def load_all_clients(clients_url)
      client_uids = G5FoundationClient::Client.all_client_uids clients_url
      client_uids.collect { |client_uid| new(client_uid).work }
    end
  end

  def work
    client = update_client
    update_locations
    update_integrations

    client
  end

  private

  def update_integrations
    foundation_client.locations.each do |location|
      G5Updatable::IntegrationSettingsUpdater.new(location.integration_settings).update
    end
  end

  def update_locations
    G5Updatable::LocationsUpdater.new(foundation_client.locations).update
  end

  def update_client
    G5Updatable::ClientUpdater.new(foundation_client).update
  end

  def foundation_client
    @foundation_client ||= G5FoundationClient::Client.find_by_uid(@client_uid)
  end

end
