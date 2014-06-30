require "g5_updatable/feed_mapper"
require "g5_updatable/client_updater"
require "g5_updatable/locations_updater"

class G5Updatable::ClientFeedProcessor
  def initialize(urn=nil)
    @urn = urn || G5Updatable.client_identifier
  end

  def work
    if @urn
      G5Updatable::ClientUpdater.new(feed_mapper.client).update
      G5Updatable::LocationsUpdater.new(feed_mapper.locations).update
    end
  end

private

  def feed_mapper
    @feed_mapper ||= G5Updatable::FeedMapper.new(@urn)
  end
end
