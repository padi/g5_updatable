module G5Updatable
  class Engine < ::Rails::Engine
    isolate_namespace G5Updatable

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :fabrication, dir: 'spec/fabricators'
      g.assets false
      g.helper false
    end
  end

  class << self
    mattr_accessor :client_uid, :location_parameters, :client_parameters,
                   :update_client, :update_locations

    self.client_uid          = nil
    self.location_parameters = [:name]
    self.client_parameters   = [:name]
    self.update_client       = false
    self.update_locations    = true
  end

  def self.setup(&block)
    yield self
  end
end
