class G5Updatable::LocationsUpdater
  def initialize(g5_locations)
    @g5_locations = g5_locations
  end

  def update
    @g5_locations.each do |g5_location|
      attributes = g5_location.location_hash.dup
      uid        = attributes[:uid]
      urn        = attributes[:urn]
      client_uid = attributes[:client_uid]

      G5Updatable::Location.
          find_or_initialize_by(uid: uid).
          update_attributes!(
          urn:        urn,
          client_uid: client_uid,
          properties: attributes
      )
    end
  end
end
