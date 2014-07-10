class G5Updatable::ClientUpdater
  def initialize(g5_client)
    @g5_client = g5_client
  end

  def update
    attributes = @g5_client.attributes.dup
    attributes.delete(:locations)
    uid = attributes.delete(:uid)
    urn = attributes.delete(:urn)

    G5Updatable::Client.
      find_or_initialize_by(uid: uid).
      update_attributes!(urn: urn, properties: attributes)
  end
end
