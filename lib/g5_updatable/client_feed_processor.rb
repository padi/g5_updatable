require "g5_updatable/feed_mapper"
require "g5_updatable/client_updater"
require "g5_updatable/locations_updater"

class G5Updatable::ClientFeedProcessor
  def self.work(urn=nil)
    G5Updatable::ClientUpdater.new(feed_mapper(urn).client).update
    G5Updatable::LocationsUpdater.new(feed_mapper(urn).locations).update
  end

  def self.feed_mapper(urn=nil)
    @feed_mapper ||= G5Updatable::FeedMapper.new(urn)
  end
end
