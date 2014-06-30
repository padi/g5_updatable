require "g5_updatable/base_updater"
require "g5_updatable/client_updater"
require "g5_updatable/locations_updater"
require "g5_updatable/parameter_mapping"

class G5Updatable::ClientFeedProcessor
  def self.client_name
    client_feed.name.to_s
  end

  def self.work
    ClientUpdater.new(client_feed).update
    LocationsUpdater.new(client_feed).update
  end

  def self.client_feed
    @client_feed ||= Microformats2.parse(G5Updatable.client_uid).first
  end
end
