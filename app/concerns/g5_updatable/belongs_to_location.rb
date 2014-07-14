module G5Updatable::BelongsToLocation
  extend ActiveSupport::Concern

  def location_uid=(location_uid)
    @location = nil
    write_attribute(:location_uid, location_uid)
  end

  def location
    @location ||= G5Updatable::Location.find_by_uid!(location_uid)
  rescue ActiveRecord::RecordNotFound
    raise ActiveRecord::RecordNotFound.new("Can't find a location for uid '#{location_uid}'")
  end
end
