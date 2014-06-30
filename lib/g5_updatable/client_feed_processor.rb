class G5Updatable::ClientFeedProcessor
  def self.work
    ClientUpdater.new(feed_mapper.client).update
    LocationsUpdater.new(feed_mapper.locations).update
  end

  def self.feed_mapper
    @feed_mapper ||= FeedMapper.new
  end
end
