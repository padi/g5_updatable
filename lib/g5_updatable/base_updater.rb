class G5Updatable::BaseUpdater
  def initialize(feed)
    @feed = feed
  end

private

  def parameter_for(map, parameter)
    @feed.send(map[parameter]).to_s
  end
end
