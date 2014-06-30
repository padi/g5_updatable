class G5Updatable::ClientUpdater < G5Updatable::BaseUpdater
  def update
    return unless G5Updatable.update_client && client

    G5Updatable.client_parameters.each do |parameter|
      client.send("#{parameter}=", parameter_for(client_mapping, parameter))
    end

    client.save
  end

private

  def client
    @client ||= Client.find_by(uid: G5Updatable.client_uid)
  end

  def client_mapping
    G5Updatable::ParameterMapping::CLIENT_MAPPING
  end
end
