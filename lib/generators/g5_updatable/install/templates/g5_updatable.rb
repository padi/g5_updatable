G5Updatable.setup do |config|
  # base path to the G5 Hub
  #
  #config.feed_endpoint = "..."

  # identifier of the client (urn)
  #
  #config.client_identifier = "..."

  # default is true. When set to true, existing locations in your app will be
  # updated with any changes made to the hub. If set to false, existing locations
  # will be skipped and only newly added locations will be created.
  #
  #config.update_locations = true

  # default is false. When set to true, client data will update.
  #
  #config.update_client = false

  # default is [:name]. A whitlist of parameters to create/update on the model
  #config.location_parameters = [:name]

  # default is [:name]. A whitlist of parameters to update on the model
  #config.client_parameters = [:name]
end
