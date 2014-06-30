class FeedMapper
  def initialize(feed)
    @feed = feed
  end

  def client
    G5Client.new(client_parameters)
  end

  def locations
     @feed.orgs.map do |location|
      G5Location.new(location_parameters(location.format))
    end
  end

private

  def client_parameters
    {
      name:  @feed.name.to_s,
      vertical:  @feed.g5_vertical.to_s,
      domain:  @feed.g5_domain.to_s,
      type:  @feed.g5_domain_type.to_s
    }
  end

  def location_parameters(location)
    {
      urn: location.uid.to_s.split("/").last,
      name: location.name.to_s,
      domain: client_feed.g5_domain.to_s,
      street_address: location.adr.try(:format).try(:street_address).to_s
      state: location.adr.try(:format).try(:region).to_s
      city: location.adr.try(:format).try(:locality).to_s
      neighborhood: location.adr.try(:format).try(:g5_neighborhood).to_s
      postal_code: location.adr.try(:format).try(:postal_code).to_s
      phone_number: location.adr.try(:format).try(:tel).to_s
      corporate: location.g5_corporate.to_s
      floor_plans: location.g5_floorplan.to_s
      primary_amenity: location.g5_aparment_amenity_1.to_s
      qualifier: location.g5_aparment_feature_1.to_s
      primary_landmark: location.g5_landmark_1.to_s
    }
  end
end
