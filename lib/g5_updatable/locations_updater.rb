class G5Updatable::LocationsUpdater
  def initialize(locations)
    @locations = locations
  end

  def update
    @locations.each { |location| process(location) unless skip?(location) }
  end

private

  def process(g5_location)
    location = Location.find_or_initialize_by(urn: urn_for(g5_location))

    G5Updatable.location_parameters.each do |parameter|
      location.send("#{parameter}=", g5_location.send(parameter))
    end

    location.save
  end

  def skip?(location)
    Location.exists?(urn: urn_for(location)) && !G5Updatable.update_locations
  end

  def urn_for(location)
    location.uid.to_s.split("/").last
  end
end
