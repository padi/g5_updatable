require "g5_updatable/feed_mapper"
require "g5_updatable/client_updater"
require "g5_updatable/locations_updater"

class G5Updatable::ClientFeedProcessor
  def self.work
    G5Updatable::ClientUpdater.new(feed_mapper.client).update
    G5Updatable::LocationsUpdater.new(feed_mapper.locations).update
  end

  def self.feed_mapper
    @feed_mapper ||= G5Updatable::FeedMapper.new
  end
end
