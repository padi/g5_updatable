class G5Updatable::ClientUpdater
  def initialize(g5_client)
    @g5_client = g5_client
  end

  def update
    return unless G5Updatable.update_client && client

    G5Updatable.client_parameters.each do |parameter|
      client.send("#{parameter}=", @g5_client.send(:parameter))
    end

    client.save
  end

private

  def client
    @client ||= Client.find_by(uid: G5Updatable.client_uid)
  end
end
