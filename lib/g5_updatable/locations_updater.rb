class G5Updatable::LocationsUpdater < G5Updatable::BaseUpdater
  def update
    @feed.orgs.each do |location|
      process(location.format) unless skip?(location.format)
    end
  end

private

  def process(feed_location)
    location = Location.find_or_initialize_by(uid: feed_location.uid.to_s)

    G5Updatable.location_parameters.each do |parameter|
      location.send("#{parameter}=", parameter_for(location_mapping, parameter))
    end

    location.save
  end

  def urn_for(location)
    location.uid.to_s.split("/").last
  end

  def skip?(location)
    Location.exists?(urn: urn_for(location)) && create_only?
  end

  def create_only?
    !G5Updatable.update_locations
  end

  def location_mapping
    G5Updatable::ParameterMapping::LOCATION_MAPPING
  end
end
