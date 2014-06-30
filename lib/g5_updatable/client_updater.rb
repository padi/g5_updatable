class G5Updatable::ClientUpdater
  def initialize(g5_client)
    @g5_client = g5_client
  end

  def update
    return unless G5Updatable.update_client && client

    G5Updatable.client_parameters.each do |parameter|
      client.send("#{parameter}=", @g5_client.send(parameter))
    end

    client.save
  end

private

  def client
    @client ||= Client.find_by(uid: client_uid) if client_uid
  end

  def client_uid
    "#{G5Updatable.feed_endpoint}#{G5Updatable.client_identifier}"
  end
end
